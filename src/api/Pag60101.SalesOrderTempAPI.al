page 60101 "APO_SalesOrderTempAPI"
{
    PageType = API;
    APIPublisher = 'picto';
    APIGroup = 'order';
    EntityName = 'order';
    EntitySetName = 'orders';
    APIVersion = 'v2.0';
    DelayedInsert = true;
    SourceTable = APO_SalesOrderTemp;
    Caption = 'apoSalesOrderTempAPI';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(adress1; Rec.Adress1)
                {
                    Caption = 'Adress', Comment = 'FRA="Adresse"';
                }
                field(adress2; Rec.Adress2)
                {
                    Caption = 'Additional address', Comment = 'FRA="Complément d''Adresse"';
                }
                field(amountExcl; Rec.AmountExcl)
                {
                    Caption = 'Amount excl. tax', Comment = 'FRA="Montant HT"';
                }
                field(amountInclTax; Rec.AmountInclTax)
                {
                    Caption = 'Amount incl. tax', Comment = 'FRA="Montant TTC"';
                }
                field(amountPaidExcl; Rec.AmountPaidExcl)
                {
                    Caption = 'Amount Paid excl. tax', Comment = 'FRA="Montant Payé HT"';
                }
                field(amountPaidInclTax; Rec.AmountPaidInclTax)
                {
                    Caption = 'Amount Paid incl. tax', Comment = 'FRA="Montant Payé TTC"';
                }
                field(city; Rec.City)
                {
                    Caption = 'City', Comment = 'FRA="Ville"';
                }
                field(clientID; Rec.ClientID)
                {
                    Caption = 'Customer ID', Comment = 'FRA="Code Client"';
                }
                field(companyName; Rec.CompanyName)
                {
                    Caption = 'CompanyName', Comment = 'FRA="Raison Social"';
                }
                field(country; Rec.Country)
                {
                    Caption = 'Country', Comment = 'FRA="Pays"';
                }
                field(customerOnlineID; Rec.CustomerOnlineID)
                {
                    Caption = 'Customer Online ID', Comment = 'FRA="Code Client Online"';
                }
                field(firstName; Rec.FirstName)
                {
                    Caption = 'FirstName', Comment = 'FRA="Prénom"';
                }
                field(itemID; Rec.ItemID)
                {
                    Caption = 'Item ID', Comment = 'FRA="Code Article"';
                }
                field(itemWording; Rec.ItemWording)
                {
                    Caption = 'Item Wording', Comment = 'FRA="Désignation"';
                }
                field(job; Rec.Job)
                {
                    Caption = 'Job', Comment = 'FRA="Profession"';
                }
                field(lastName; Rec.LastName)
                {
                    Caption = 'LastName', Comment = 'FRA="Nom"';
                }
                field(lineID; Rec.LineID)
                {
                    Caption = 'Line ID', Comment = 'FRA="ID de la ligne"';
                }
                field(orderDate; Rec.OrderDate)
                {
                    Caption = 'Order Date', Comment = 'FRA="Date de commande"';
                }
                field(orderID; Rec.OrderID)
                {
                    Caption = 'Order ID', Comment = 'FRA="Numéro de commande"';
                }
                field(orderType; Rec.OrderType)
                {
                    Caption = 'OrderType', Comment = 'FRA="Type de commande"';
                }
                field(originOrderID; Rec.OriginOrderID)
                {
                    Caption = 'Origin Order ID', Comment = 'FRA="Numéro de commande Online"';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity', Comment = 'FRA="Quantité"';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
                field(title; Rec.Title)
                {
                    Caption = 'Title', Comment = 'FRA="Civilité"';
                }
                field(zipCode; Rec.ZipCode)
                {
                    Caption = 'Zip Code', Comment = 'FRA="Code Postal"';
                }
            }
        }
    }
}
