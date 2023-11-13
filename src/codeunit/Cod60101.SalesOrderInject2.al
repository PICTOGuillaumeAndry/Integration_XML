codeunit 60101 "APO_SalesOrderInject2"
{
    procedure ProcessAndInsertOrders()
    var
        SalesTemp: Record "APO_SalesOrderTemp";
        SalesHeaderRec: Record "Sales Header";
        SalesLineRec: Record "Sales Line";
        LastOrderID: Code[20];

    begin
        // Remplissage du header uniquement si l'ordre n'existe pas déjà
        if not GetByOnlineOrderID(SalesTemp.OrderID) then begin
            InsertSalesHeader(SalesHeaderRec, SalesTemp);
            LastOrderID := SalesTemp.OrderID;
        end;

    end;


    // Cette fonction vérifie si un enregistrement de Sales Header avec le même OnlineOrderID existe déjà
    procedure GetByOnlineOrderID(OrderID: Code[20]): Boolean
    var
        SalesHeaderRec: Record "Sales Header";
    begin
        SalesHeaderRec.SetRange("APO_OriginOrderID", OrderID);
        exit(SalesHeaderRec.FindFirst());
    end;

    procedure InsertSalesHeader(var SalesHeaderRec: Record "Sales Header"; SalesTemp: Record "APO_SalesOrderTemp")
    begin
        SalesHeaderRec.Init();
        SalesHeaderRec."No." := '101013';
        SalesHeaderRec."Document Type" := SalesHeaderRec."Document Type"::Order;
        SalesHeaderRec."Sell-to Customer No." := SalesTemp.ClientID;

        SalesHeaderRec."Sell-to Customer Name" := SalesTemp.LastName;
        SalesHeaderRec."Sell-to Address" := SalesTemp.Adress1;
        SalesHeaderRec."Sell-to Address 2" := SalesTemp.Adress2;
        SalesHeaderRec."Sell-to City" := SalesTemp.City;
        SalesHeaderRec."Sell-to Post Code" := SalesTemp.ZipCode;
        SalesHeaderRec."Sell-to County" := SalesTemp.Country;

        SalesHeaderRec."Bill-to Name" := SalesTemp.LastName;
        SalesHeaderRec."Bill-to Address" := SalesTemp.Adress1;
        SalesHeaderRec."Bill-to Address 2" := SalesTemp.Adress2;
        SalesHeaderRec."Bill-to City" := SalesTemp.City;
        SalesHeaderRec."Bill-to Post Code" := SalesTemp.ZipCode;
        SalesHeaderRec."Bill-to County" := SalesTemp.Country;

        SalesHeaderRec."Ship-to Name" := SalesTemp.LastName;
        SalesHeaderRec."Ship-to Address" := SalesTemp.Adress1;
        SalesHeaderRec."Ship-to Address 2" := SalesTemp.Adress2;
        SalesHeaderRec."Ship-to City" := SalesTemp.City;
        SalesHeaderRec."Ship-to Post Code" := SalesTemp.ZipCode;
        SalesHeaderRec."Ship-to County" := SalesTemp.Country;

        SalesHeaderRec."Order Date" := SalesTemp.OrderDate;
        SalesHeaderRec."APO_OriginOrderID" := SalesTemp.OrderID;
        SalesHeaderRec."Amount" := SalesTemp.AmountPaidExcl;
        SalesHeaderRec."Amount Including VAT" := SalesTemp.AmountPaidInclTax;

        // ... autres champs d'en-tête
        SalesHeaderRec.Insert();
    end;

    procedure InsertSalesLine(SalesHeaderRec: Record "Sales Header"; var SalesLineRec: Record "Sales Line"; SalesTemp: Record "APO_SalesOrderTemp")
    begin
        SalesLineRec.Init();
        SalesLineRec."Document No." := SalesHeaderRec."No.";
        SalesLineRec."Document Type" := SalesHeaderRec."Document Type";
        SalesLineRec.Type := SalesLineRec.Type::Item;
        SalesLineRec."No." := SalesTemp.ItemID;
        SalesLineRec.Description := SalesTemp.ItemWording;
        SalesLineRec.Quantity := SalesTemp.Quantity;
        SalesLineRec.Amount := SalesTemp.AmountExcl;
        SalesLineRec."Amount Including VAT" := SalesTemp.AmountInclTax;

        // ... autres champs de la ligne
        SalesLineRec.Insert(true);
    end;
    // ... (Le reste du code pour InsertSalesHeader et InsertSalesLine reste le même)
}
