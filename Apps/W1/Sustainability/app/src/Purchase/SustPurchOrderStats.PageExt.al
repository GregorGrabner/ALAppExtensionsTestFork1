namespace Microsoft.Sustainability.Purchase;

using Microsoft.Purchases.Document;

pageextension 6217 "Sust. Purch. Order Stats." extends "Purchase Order Statistics"
{
    layout
    {
        addafter(Vendor)
        {
            group(Sustainability)
            {
                Visible = EnableSustainability;
                field("Sustainability Lines Exist"; "Sustainability Lines Exist")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sustainability Lines Exist';
                }
                field("Emission C02"; Rec."Emission C02")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Emission C02';
                }
                field("Emission CH4"; Rec."Emission CH4")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Emission CH4';
                }
                field("Emission N2O"; Rec."Emission N2O")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Emission N2O';
                }
                field("Posted Emission C02"; Rec."Posted Emission C02")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Emission C02';
                }
                field("Posted Emission CH4"; Rec."Posted Emission CH4")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Emission CH4';
                }
                field("Posted Emission N2O"; Rec."Posted Emission N2O")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Emission N2O';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        EnableSustainabilityControl();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        EnableSustainabilityControl();
    end;

    trigger OnAfterGetRecord()
    begin
        EnableSustainabilityControl();
    end;

    local procedure EnableSustainabilityControl()
    begin
        Rec.CalcFields("Sustainability Lines Exist");
        EnableSustainability := Rec."Sustainability Lines Exist";
    end;

    var
        EnableSustainability: Boolean;
}