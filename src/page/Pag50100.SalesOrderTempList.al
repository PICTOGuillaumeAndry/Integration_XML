page 60100 "APO_SalesOrderTempList"
{
    ApplicationArea = All;
    Caption = 'APO_SalesOrderTempList';
    PageType = List;
    SourceTable = APO_SalesOrderTemp;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("ID Client"; Rec.ClientID)
                {
                    ApplicationArea = All;
                    ToolTip = '?';

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Customer Card", Rec)
                    end;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(CompanyName; Rec.CompanyName)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(FirstName; Rec.FirstName)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(LastName; Rec.LastName)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(Adress1; Rec.Adress1)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(Adresse2; Rec.Adress2)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(ZipCode; Rec.ZipCode)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(OrderDate; Rec.OrderDate)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(OrderType; Rec.OrderType)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(ItemID; Rec.ItemID)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(ItemWording; Rec.ItemWording)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(AmountExcl; Rec.AmountExcl)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(AmountInclTax; Rec.AmountInclTax)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(AmountPaidExcl; Rec.AmountPaidExcl)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(AmountPaidInclTax; Rec.AmountPaidInclTax)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(CustomerOnlineID; Rec.CustomerOnlineID)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(OriginOrderID; Rec.OriginOrderID)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(OrderID; Rec.OrderID)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
                field(LineID; Rec.LineID)
                {
                    ApplicationArea = All;
                    ToolTip = '?';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportXML)
            {
                ApplicationArea = All;
                Caption = 'Import XML';
                Image = Import;
                ToolTip = 'Import manuel commande Online';

                trigger OnAction()
                var
                    Import: XmlPort APO_ImportSalesOrder;
                begin
                    Import.Run()
                end;
            }
            // action(ExportXML)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Export XML';
            //     Image = Export;
            //     ToolTip = 'Export manuel commande Online';

            //     trigger OnAction()
            //     var
            //         Import: XmlPort APO_ExportSalesOrder;
            //     begin
            //         Import.Run()
            //     end;
            // }

            action(InjectXML)
            {
                ApplicationArea = All;
                Caption = 'Injection dans BC';
                Image = SendConfirmation;
                Tooltip = 'Injecter les commandes de la liste';

                trigger OnAction()

                var
                    Inject: Codeunit "APO_int";
                begin
                    Inject.Run()
                end;
            }
        }
    }
}