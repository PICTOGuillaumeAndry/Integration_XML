pageextension 60100 "APO_SalesOrder" extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field(APO_OriginOrderID; Rec.APO_OriginOrderID)
            {
                ApplicationArea = All;
                Caption = 'Origin Order ID';
                ToolTip = 'Origin Order ID';
                Editable = false;
            }
        }
    }
}