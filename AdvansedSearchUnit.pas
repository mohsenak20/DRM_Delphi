unit AdvansedSearchUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, ADODB, StdCtrls, Buttons, Mask;

type
  TfrmAdvansedSearch = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    edtStartDate: TMaskEdit;
    edtKeyNumber: TEdit;
    Label21: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtEndDate: TMaskEdit;
    Label3: TLabel;
    edtReceptionID: TEdit;
    Label4: TLabel;
    edtCustomerName: TEdit;
    BBtnAccept: TBitBtn;
    QSearch: TADOQuery;
    dsSearch: TDataSource;
    procedure BBtnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdvansedSearch: TfrmAdvansedSearch;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmAdvansedSearch.BBtnAcceptClick(Sender: TObject);
var
  strFilter : string;
begin
    strFilter:='';
    if edtReceptionID.Text<>'' then
    begin
        strFilter:=' ReeptionID='+edtReceptionID.Text;
    end
    else
    begin
        if edtStartDate.Text<>'1   /  /  ' then
            if edtEndDate.Text<>'1   /  /  ' then
                if strFilter='' then
                    strFilter:=' ExportDate >= '+QuotedStr(edtStartDate.Text)+' and ExportDate <= '+QuotedStr(edtEndDate.Text)
                else
                    strFilter:=strFilter+' and ExportDate >= '+QuotedStr(edtStartDate.Text)+' and ExportDate <= '+QuotedStr(edtEndDate.Text)
            else
                if strFilter='' then
                    strFilter:=' ExportDate >= '+QuotedStr(edtStartDate.Text)
                else
                    strFilter:=strFilter+' and ExportDate >= '+QuotedStr(edtStartDate.Text)
        else
            if edtEndDate.Text<>'1   /  /  ' then
                if strFilter='' then
                    strFilter:=' ExportDate <= '+QuotedStr(edtEndDate.Text)
                else
                    strFilter:=strFilter+' and ExportDate <= '+QuotedStr(edtEndDate.Text);
        if edtKeyNumber.Text<>'' then
            if strFilter<>'' then
                strFilter:=strFilter//+' and KeyNumber


    end;
end;

end.
