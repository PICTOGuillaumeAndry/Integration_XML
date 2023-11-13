xmlport 60105 "APO_ImportSalesOrder"

{
    Format = Xml;
    Direction = Both;
    // UseRequestPage = false;

    schema
    {
        tableelement("ordercollection"; "APO_SalesOrderHeader")
        {
            textelement("Codes")
            {
                fieldelement("Codeclient"; "ordercollection"."ClientID")
                {

                }
                fieldelement("Codeclienttiragedirect"; "ordercollection"."CustomerOnlineID")
                {

                }
            }
            textelement(Clientfacture)
            {
                fieldelement("Prenom"; "ordercollection"."FirstName")
                {

                }
                fieldelement("Nom"; "ordercollection"."LastName")
                {

                }
                fieldelement("RaisonSociale"; "ordercollection"."CompanyName")
                {

                }
                fieldelement("Adresse1"; "ordercollection"."Adress1")
                {

                }
                fieldelement("Adresse2"; "ordercollection"."Adress2")
                {

                }
                fieldelement("Codepostal"; "ordercollection"."ZipCode")
                {

                }
                fieldelement("Ville"; "ordercollection"."City")
                {

                }
                fieldelement("Pays"; "ordercollection"."Country")
                {

                }
            }
            textelement(Clientlivre)
            {
                fieldelement("Prenom"; "ordercollection"."FirstName")
                {

                }
                fieldelement("Nom"; "ordercollection"."LastName")
                {

                }
                fieldelement("RaisonSociale"; "ordercollection"."CompanyName")
                {

                }
                fieldelement("Adresse1"; "ordercollection"."Adress1")
                {

                }
                fieldelement("Adresse2"; "ordercollection"."Adress2")
                {

                }
                fieldelement("Codepostal"; "ordercollection"."ZipCode")
                {

                }
                fieldelement("Ville"; "ordercollection"."City")
                {

                }
                fieldelement("Pays"; "ordercollection"."Country")
                {

                }
            }
            textelement(Client)
            {
                fieldelement("Civilite"; "ordercollection"."Title")
                {

                }
                fieldelement("RaisonSociale"; "ordercollection"."CompanyName")
                {

                }
                fieldelement("Nom"; "ordercollection"."LastName")
                {

                }
                fieldelement("Prenom"; "ordercollection"."FirstName")
                {

                }
                fieldelement("profession"; "ordercollection"."Job")
                {

                }
            }
            textelement(Infoscommande)
            {
                fieldelement("Datecommande"; "ordercollection"."OrderDate")
                {

                }
                fieldelement("Numerocommande"; "ordercollection"."OnlineOrderID")
                {

                }
                fieldelement("MontantpayeHT"; "ordercollection"."AmountPaidExcl")
                {

                }
                fieldelement("MontantpayeTTC"; "ordercollection"."AmountPaidInclTax")
                {

                }
            }
            textelement("Infosarticles")
            {
                tableelement(Infoarticle; "APO_SalesOrderTemp")
                {
                    fieldelement("Codearticle"; Infoarticle."ItemID")
                    {
                    }
                    fieldelement("Designation"; Infoarticle."ItemWording")
                    {
                    }
                    fieldelement("Quantite"; Infoarticle."Quantity")
                    {
                    }
                    fieldelement("MontantHT"; Infoarticle."AmountExcl")
                    {
                    }
                    fieldelement("MontantTTC"; Infoarticle."AmountInclTax")
                    {
                    }

                    trigger OnBeforeInsertRecord()
                    begin

                        Infoarticle."ClientID" := ordercollection.ClientID;
                        Infoarticle."CustomerOnlineID" := ordercollection.CustomerOnlineID;
                        Infoarticle."FirstName" := ordercollection.FirstName;
                        Infoarticle."LastName" := ordercollection.LastName;
                        Infoarticle."CompanyName" := ordercollection.CompanyName;
                        Infoarticle."Adress1" := ordercollection.Adress1;
                        Infoarticle."Adress2" := ordercollection.Adress2;
                        Infoarticle."ZipCode" := ordercollection.ZipCode;
                        Infoarticle."City" := ordercollection.City;
                        Infoarticle."Country" := ordercollection.Country;
                        Infoarticle."Title" := ordercollection.Title;
                        Infoarticle."Job" := ordercollection.Job;
                        Infoarticle."OrderDate" := ordercollection.OrderDate;
                        Infoarticle."OriginOrderID" := ordercollection.OnlineOrderID;
                        Infoarticle."AmountPaidExcl" := ordercollection.AmountPaidExcl;
                        Infoarticle."AmountPaidInclTax" := ordercollection.AmountPaidInclTax;

                        // Infoarticle."ClientID" := TempClientID;
                        // Infoarticle."CustomerOnlineID" := TempCustomerOnlineID;
                        // Infoarticle."FirstName" := TempFirstName;
                        // Infoarticle."LastName" := TempLastName;
                        // Infoarticle."CompanyName" := TempCompanyName;
                        // Infoarticle."Adress1" := TempAdress1;
                        // Infoarticle."Adress2" := TempAdress2;
                        // Infoarticle."ZipCode" := TempZipCode;
                        // Infoarticle."City" := TempCity;
                        // Infoarticle."Country" := TempCountry;
                        // Infoarticle."Title" := TempTitle;
                        // Infoarticle."Job" := TempJob;
                        // Infoarticle."OrderDate" := TempOrderDate;
                        // Infoarticle."OriginOrderID" := TempOnlineOrderID;
                        // Infoarticle."AmountPaidExcl" := TempAmountPaidExcl;
                        // Infoarticle."AmountPaidInclTax" := TempAmountPaidInclTax;

                    end;
                }
            }
        }
    }
}