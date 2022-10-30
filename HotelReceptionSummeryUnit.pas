unit HotelReceptionSummeryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmHotelTicketSummery = class(TForm)
    Panel1: TPanel;
    Label14: TLabel;
    Label3: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    btnSearch: TBitBtn;
    Panel2: TPanel;
    BtnReturn: TBitBtn;
    DBGrid1: TDBGrid;
    QHotelReception: TADOQuery;
    dsHotelReception: TDataSource;
    Label4: TLabel;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    ExportToExcel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHotelTicketSummery: TfrmHotelTicketSummery;

implementation
uses DMUnit, CalculatUnit, UserInfoUnit, ShareUnit;


{$R *.dfm}

procedure TfrmHotelTicketSummery.FormCreate(Sender: TObject);
begin
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
    btnSearch.Click();
end;

procedure TfrmHotelTicketSummery.btnSearchClick(Sender: TObject);
var
  strFilter : string;
begin
    strFilter := 'issueDate >= ' + QuotedStr(edtStartDate.Text) + ' and issueDate <= ' + QuotedStr(edtEndDate.Text);
    if edtUserID.Text <> '' then strFilter := strFilter + ' and UserId =' + edtUserID.Text;
    QHotelReception.Close;
    QHotelReception.SQL.Clear;
    QHotelReception.SQL.Add('select issueDate, sum(menAdult) sumMenAdult, Format(sum(menAdult*adultPrice), ''C0'') sumMenAdultPrice,');
    QHotelReception.SQL.Add('sum(menChild) sumMenChild, sum(menChild*childPrice) sumMenChildPrice, ');
    QHotelReception.SQL.Add('sum(womenAdult) sumWomenAdult, sum(womenAdult*adultPrice) sumWomenAdultPrice,');
    QHotelReception.SQL.Add('sum(womenChild) sumWomenChild, sum(womenChild*childPrice) sumWomenChildPrice,');
    QHotelReception.SQL.Add('sum(menAdult+womenAdult) sumAdult, sum((menAdult+womenAdult)*adultPrice) sumAdultPrice,');
    QHotelReception.SQL.Add('sum(menChild+womenChild) sumChild, sum((menChild+womenChild)*childPrice) sumChildPrice,');
    QHotelReception.SQL.Add('sum(menAdult+menChild+womenAdult+womenChild) sumCustomer, ');
    QHotelReception.SQL.Add('sum((menAdult+womenAdult)*adultPrice)+sum((menChild+womenChild)*childPrice) sumPrice');
    QHotelReception.SQL.Add('from HotelTickets');
    QHotelReception.SQL.Add('where '+strFilter);
    QHotelReception.SQL.Add('group by issueDate');
    QHotelReception.Open;
end;

procedure TfrmHotelTicketSummery.BtnReturnClick(Sender: TObject);
begin
    Close;
end;
procedure TfrmHotelTicketSummery.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        btnSearch.SetFocus;
    end;
    FreeAndNil(frmUserInfo);
end;

procedure TfrmHotelTicketSummery.ExportToExcelClick(Sender: TObject);
begin
  ExportToExl(QHotelReception);
end;

end.
