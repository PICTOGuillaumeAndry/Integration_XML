table 60101 "APO_SalesOrderHeader"
{
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; ClientID; Code[6])
        {
            Caption = 'Customer ID', comment = 'FRA="Code Client"';
            DataClassification = ToBeClassified;
        }

        field(2; Title; Text[5])
        {
            Caption = 'Title', comment = 'FRA="Civilité"';
            DataClassification = ToBeClassified;
        }
        field(3; CompanyName; Text[26])
        {
            Caption = 'CompanyName', comment = 'FRA="Raison Social"';
            DataClassification = ToBeClassified;
        }
        field(4; FirstName; Text[20])
        {
            Caption = 'FirstName', comment = 'FRA="Prénom"';
            DataClassification = ToBeClassified;
        }
        field(5; LastName; Text[20])
        {
            Caption = 'LastName', comment = 'FRA="Nom"';
            DataClassification = ToBeClassified;
        }
        field(6; Job; Text[64])
        {
            Caption = 'Job', comment = 'FRA="Profession"';
            DataClassification = ToBeClassified;
        }
        field(7; Adress1; Text[60])
        {
            Caption = 'Adress', comment = 'FRA="Adresse"';
            DataClassification = ToBeClassified;
        }
        field(8; Adress2; Text[60])
        {
            Caption = 'Additional address', comment = 'FRA="Complément d''Adresse"';
            DataClassification = ToBeClassified;
        }
        field(9; ZipCode; Text[6])
        {
            Caption = 'Zip Code', comment = 'FRA="Code Postal"';
            DataClassification = ToBeClassified;
        }
        field(10; City; Text[26])
        {
            Caption = 'City', comment = 'FRA="Ville"';
            DataClassification = ToBeClassified;
        }
        field(11; Country; Text[20])
        {
            Caption = 'Country', comment = 'FRA="Pays"';
            DataClassification = ToBeClassified;
        }
        field(12; OrderDate; Date)
        {
            Caption = 'Order Date', comment = 'FRA="Date de commande"';
            DataClassification = ToBeClassified;
        }
        field(13; OrderType; Option)
        {
            OptionMembers = "CC","CP";
            Caption = 'OrderType', comment = 'FRA="Type de commande"';
            DataClassification = ToBeClassified;
        }
        field(20; AmountPaidExcl; Decimal)
        {
            Caption = 'Amount Paid excl. tax', comment = 'FRA="Montant Payé HT"';
            DataClassification = ToBeClassified;
        }
        field(21; AmountPaidInclTax; Decimal)
        {
            Caption = 'Amount Paid incl. tax', comment = 'FRA="Montant Payé TTC"';
            DataClassification = ToBeClassified;
        }
        field(22; CustomerOnlineID; Code[20])
        {
            Caption = 'Customer Online ID', comment = 'FRA="Code Client Online"';
            DataClassification = ToBeClassified;
        }
        field(23; OnlineOrderID; Code[20])
        {
            Caption = 'Online Order ID', comment = 'FRA="Numéro de commande Online"';
            DataClassification = ToBeClassified;
        }
        field(24; OrderID; Code[20])
        {
            Caption = 'Order ID', comment = 'FRA="Numéro de commande"';
            DataClassification = ToBeClassified;
        }
    }
}
