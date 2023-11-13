codeunit 60102 "APO_int"
{
    trigger OnRun()
    begin
        CreateSalesOrderFromTemp();
    end;

    procedure CreateSalesOrderFromTemp()
    var
        TempOrder: Record "APO_SalesOrderTemp";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesPost: Codeunit "Sales-Post";
        Nomgt: Codeunit "NoSeriesManagement";
        LastOrderID: Code[20];
        LineNo: Integer;
        OrderNo: Code[20];
    begin
        LastOrderID := '';

        // Parcourir les lignes de commande temporaires
        if TempOrder.FindSet() then
            repeat
                // Si le numéro de commande a changé, créez un nouvel en-tête de commande
                if TempOrder.OriginOrderID <> LastOrderID then begin
                    SalesHeader.Init();
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                    SalesHeader."No." := Nomgt.GetNextNo('V-CDE', Today, true);
                    OrderNo := SalesHeader."No.";
                    SalesHeader."Sell-to Customer No." := TempOrder.ClientID;
                    SalesHeader."Bill-to Customer No." := TempOrder.ClientID;
                    SalesHeader.Amount := TempOrder.AmountPaidExcl;
                    SalesHeader."Amount Including VAT" := TempOrder.AmountPaidInclTax;
                    SalesHeader."Order Date" := TempOrder.OrderDate;
                    SalesHeader."Posting Date" := Today;
                    SalesHeader."Due Date" := Today;
                    SalesHeader."Document Date" := Today;

                    // Définir d'autres champs de SalesHeader si nécessaire
                    SalesHeader.Invoice := false;
                    SalesHeader.Ship := true;
                    SalesHeader.Receive := true;
                    SalesHeader.Insert(true);
                    LastOrderID := TempOrder.OriginOrderID;
                    SalesPost.Run(SalesHeader);
                    LineNo := 10000; // Initialiser le numéro de ligne pour chaque nouvelle commande
                end;

                // Création de la ligne de commande à partir de la ligne temporaire
                SalesLine.Init();
                SalesLine.Type := SalesLine.Type::Item;
                SalesLine."Document Type" := SalesLine."Document Type"::Order;
                SalesLine."Line Amount" := TempOrder.AmountExcl;
                SalesLine."Posting Date" := Today;
                SalesLine."Shipment Date" := Today;
                SalesLine."Planned Delivery Date" := Today;
                SalesLine."Document No." := OrderNo;
                SalesLine."Line No." := LineNo; // Utiliser le numéro de ligne
                SalesLine."No." := TempOrder.ItemID;
                SalesLine.Quantity := TempOrder.Quantity; // Remplacez par la quantité réelle
                SalesLine.Amount := TempOrder.AmountExcl;
                SalesLine."Amount Including VAT" := TempOrder.AmountInclTax;
                // Définir d'autres champs de SalesLine si nécessaire
                SalesLine.Insert(true);
                LineNo += 10000; // Incrémenter le numéro de ligne

            until TempOrder.Next() = 0;

        // Poster la commande de vente


        // Supprimer tous les enregistrements de la table temporaire
        TempOrder.DeleteAll();
    end;
}