xmlport 60105 "APO_ImportSalesOrder"

{
    Format = Xml;
    Direction = Import;

    schema
    {
        tableelement("ordercollection"; "APO_SalesOrderHeader")
        {
            textelement("Codes")
            {
                fieldelement("Codeclient"; "ordercollection"."ClientID")
                {
                    trigger OnBeforePassField()
                    begin
                        TempClientID := "ordercollection"."ClientID";
                    end;
                }
                fieldelement("Codeclienttiragedirect"; "ordercollection"."CustomerOnlineID")
                {
                    trigger OnBeforePassField()
                    begin
                        TempCustomerOnlineID := "ordercollection"."CustomerOnlineID";
                    end;
                }
            }
            textelement(Clientfacture)
            {
                fieldelement("Prenom"; "ordercollection"."FirstName")
                {
                    trigger OnBeforePassField()
                    begin
                        TempFirstName := "ordercollection"."FirstName";
                    end;
                }
                fieldelement("Nom"; "ordercollection"."LastName")
                {
                    trigger OnBeforePassField()
                    begin
                        TempLastName := "ordercollection"."LastName";
                    end;
                }
                fieldelement("RaisonSociale"; "ordercollection"."CompanyName")
                {
                    trigger OnBeforePassField()
                    begin
                        TempCompanyName := "ordercollection"."CompanyName";
                    end;
                }
                fieldelement("Adresse1"; "ordercollection"."Adress1")
                {
                    trigger OnBeforePassField()
                    begin
                        TempAdress1 := "ordercollection"."Adress1";
                    end;
                }
                fieldelement("Adresse2"; "ordercollection"."Adress2")
                {
                    trigger OnBeforePassField()
                    begin
                        TempAdress2 := "ordercollection"."Adress2";
                    end;
                }
                fieldelement("Codepostal"; "ordercollection"."ZipCode")
                {
                    trigger OnBeforePassField()
                    begin
                        TempZipCode := "ordercollection"."ZipCode";
                    end;
                }
                fieldelement("Ville"; "ordercollection"."City")
                {
                    trigger OnBeforePassField()
                    begin
                        TempCity := "ordercollection"."City";
                    end;
                }
                fieldelement("Pays"; "ordercollection"."Country")
                {
                    trigger OnBeforePassField()
                    begin
                        TempCountry := "ordercollection"."Country";
                    end;
                }
            }
            textelement(Clientlivre)
            {
                fieldelement("Prenom"; "ordercollection"."FirstName")
                {
                    trigger OnBeforePassField()
                    begin
                        TempFirstName := "ordercollection"."FirstName";
                    end;
                }
                fieldelement("Nom"; "ordercollection"."LastName")
                {
                    trigger OnBeforePassField()
                    begin
                        TempLastName := "ordercollection"."LastName";
                    end;
                }
                fieldelement("RaisonSociale"; "ordercollection"."CompanyName")
                {
                    trigger OnBeforePassField()
                    begin
                        TempCompanyName := "ordercollection"."CompanyName";
                    end;
                }
                fieldelement("Adresse1"; "ordercollection"."Adress1")
                {
                    trigger OnBeforePassField()
                    begin
                        TempAdress1 := "ordercollection"."Adress1";
                    end;
                }
                fieldelement("Adresse2"; "ordercollection"."Adress2")
                {
                    trigger OnBeforePassField()
                    begin
                        TempAdress2 := "ordercollection"."Adress2";
                    end;
                }
                fieldelement("Codepostal"; "ordercollection"."ZipCode")
                {
                    trigger OnBeforePassField()
                    begin
                        TempZipCode := "ordercollection"."ZipCode";
                    end;
                }
                fieldelement("Ville"; "ordercollection"."City")
                {
                    trigger OnBeforePassField()
                    begin
                        TempCity := "ordercollection"."City";
                    end;
                }
                fieldelement("Pays"; "ordercollection"."Country")
                {
                    trigger OnBeforePassField()
                    begin
                        TempCountry := "ordercollection"."Country";
                    end;
                }
            }
            textelement(Client)
            {
                fieldelement("Civilite"; "ordercollection"."Title")
                {
                    trigger OnBeforePassField()
                    begin
                        TempTitle := "ordercollection"."Title";
                    end;
                }
                fieldelement("RaisonSociale"; "ordercollection"."CompanyName")
                {
                    trigger OnBeforePassField()
                    begin
                        TempCompanyName := "ordercollection"."CompanyName";
                    end;
                }
                fieldelement("Nom"; "ordercollection"."LastName")
                {
                    trigger OnBeforePassField()
                    begin
                        TempLastName := "ordercollection"."LastName";
                    end;
                }
                fieldelement("Prenom"; "ordercollection"."FirstName")
                {
                    trigger OnBeforePassField()
                    begin
                        TempFirstName := "ordercollection"."FirstName";
                    end;
                }
                fieldelement("profession"; "ordercollection"."Job")
                {
                    trigger OnBeforePassField()
                    begin
                        TempJob := "ordercollection"."Job";
                    end;
                }
            }
            textelement(Infoscommande)
            {
                fieldelement("Datecommande"; "ordercollection"."OrderDate")
                {
                    trigger OnBeforePassField()
                    begin
                        TempOrderDate := "ordercollection"."OrderDate";
                    end;
                }
                fieldelement("Numerocommande"; "ordercollection"."OnlineOrderID")
                {
                    trigger OnBeforePassField()
                    begin
                        TempOnlineOrderID := "ordercollection"."OnlineOrderID";
                    end;
                }
                fieldelement("MontantpayeHT"; "ordercollection"."AmountPaidExcl")
                {
                    trigger OnBeforePassField()
                    begin
                        TempAmountPaidExcl := "ordercollection"."AmountPaidExcl";
                    end;
                }
                fieldelement("MontantpayeTTC"; "ordercollection"."AmountPaidInclTax")
                {
                    trigger OnBeforePassField()
                    begin
                        TempAmountPaidInclTax := "ordercollection"."AmountPaidInclTax";
                    end;
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

                    end;
                }
            }
        }
    }

    var
        TempClientID: Code[20];
        TempCustomerOnlineID: Code[20];
        TempFirstName: Text[50];
        TempLastName: Text[50];
        TempCompanyName: Text[50];
        TempAdress1: Text[50];
        TempAdress2: Text[50];
        TempZipCode: Text[10];
        TempCity: Text[30];
        TempCountry: Text[30];
        TempTitle: Text[10];
        TempJob: Text[30];
        TempOrderDate: Date;
        TempOnlineOrderID: Code[20];
        TempAmountPaidExcl: Decimal;
        TempAmountPaidInclTax: Decimal;
}