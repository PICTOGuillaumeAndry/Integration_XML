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

                    // KEYS
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                    SalesHeader."No." := Nomgt.GetNextNo('V-CDE', Today, true);
                    SalesHeader."Sell-to Customer No." := TempOrder.ClientID;
                    SalesHeader."Bill-to Customer No." := TempOrder.ClientID;
                    SalesHeader."Document Date" := Today;
                    OrderNo := SalesHeader."No.";
                    SalesHeader."External Document No." := TempOrder.OriginOrderID;
                    SalesHeader."Sell-to Address" := TempOrder.Adress1;
                    SalesHeader."Sell-to Customer Name" := TempOrder.LastName;
                    SalesHeader."Sell-to County" := TempOrder.Country;
                    SalesHeader."Sell-to Post Code" := TempOrder.ZipCode;
                    SalesHeader."Sell-to City" := TempOrder.City;

                    SalesHeader."Bill-to Name" := TempOrder.CompanyName;
                    SalesHeader."Bill-to Address" := TempOrder.Adress1;
                    SalesHeader."Bill-to County" := TempOrder.Country;
                    SalesHeader."Bill-to Post Code" := TempOrder.ZipCode;
                    SalesHeader."Bill-to City" := TempOrder.City;
                    SalesHeader."Bill-to Name 2" := TempOrder.FirstName;

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
                    LineNo := 10000; // Initialiser le numéro de ligne pour chaque nouvelle commande
                end;

                // Création de la ligne de commande à partir de la ligne temporaire
                SalesLine.Init();
                SalesLine."Document No." := OrderNo;
                SalesLine."Document Type" := SalesLine."Document Type"::Order;
                SalesLine."Line No." := LineNo; // Utiliser le numéro de ligne
                SalesLine.Type := SalesLine.Type::Item;

                SalesLine."Bill-to Customer No." := TempOrder.ClientID;
                SalesLine."Sell-to Customer No." := TempOrder.ClientID;

                SalesLine."Posting Date" := Today;
                SalesLine."Shipment Date" := Today;
                SalesLine."Planned Delivery Date" := Today;

                SalesLine."No." := TempOrder.ItemID;
                SalesLine."Unit of Measure Code" := 'PCS';
                SalesLine.Quantity := TempOrder.Quantity;
                SalesLine."Quantity (Base)" := TempOrder.Quantity;
                SalesLine."Quantity Shipped" := TempOrder.Quantity;
                SalesLine."Quantity Invoiced" := 0;

                SalesLine."Line Amount" := TempOrder.AmountExcl;
                SalesLine.Amount := TempOrder.AmountExcl;
                SalesLine."Amount Including VAT" := TempOrder.AmountInclTax;
                // Définir d'autres champs de SalesLine si nécessaire
                SalesLine.Insert(true);
                LineNo += 10000; // Incrémenter le numéro de ligne

            until TempOrder.Next() = 0;

        // Poster la commande de vente
        SalesPost.Run(SalesHeader);

        // Supprimer tous les enregistrements de la table temporaire
        TempOrder.DeleteAll();
    end;
}

// Si vous demandez de l’assistance, fournissez les détails suivants pour le dépannage:

// Il n’y a rien à valider, car le document ne contient pas de quantité ni de montant.

// ID de session interne : 
// 5e2e3990-a002-4894-909b-fc723d1c6e7c

// ID de session Application Insights : 
// 60faf62b-503c-4783-8f5d-36be43d55234

// ID de l’activité cliente : 
// 7289a73c-266b-47e4-9100-eb3648dd7afc

// Horodatage sur erreur : 
// 2023-11-13T13:25:21.6167565Z

// ID télémétrie utilisateur : 
// 1bc20468-5775-4301-8821-9bf747d051af

// Pile d’appels AL : 
// "Sales-Post"(CodeUnit 80).CheckHeaderPostingType line 10 - Base Application by Microsoft
// "Sales-Post"(CodeUnit 80).CheckSalesDocument line 64 - Base Application by Microsoft
// "Sales-Post"(CodeUnit 80).CheckAndUpdate line 7 - Base Application by Microsoft
// "Sales-Post"(CodeUnit 80).RunWithCheck line 57 - Base Application by Microsoft
// "Sales-Post"(CodeUnit 80).OnRun(Trigger) line 2 - Base Application by Microsoft
// APO_int(CodeUnit 60102).CreateSalesOrderFromTemp line 89 - Integration_XML by Default publisher
// APO_int(CodeUnit 60102).OnRun(Trigger) line 2 - Integration_XML by Default publisher
// APO_SalesOrderTempList(Page 60100)."InjectXML - OnAction"(Trigger) line 5 - Integration_XML by Default publisher

// Axes analytiques personnalisés : 
// []
