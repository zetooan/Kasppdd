unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, System.Rtti,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, DBAccess, MyAccess, MemDS, FMX.Layouts, FMX.Grid, FMX.Edit;

type
  TForm4 = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    Grid1: TGrid;
    MyQuery1: TMyQuery;
    MyConnection1: TMyConnection;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    Label9: TLabel;
    Edit1: TEdit;
    SearchEditButton1: TSearchEditButton;
    MyQuery2: TMyQuery;
    procedure Rectangle1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Button1Click(Sender: TObject);
begin
 MyQuery2.SQL.Clear;
 MyQuery2.SQL.Add('UPDATE dana SET status =:A WHERE no_dana ='+QuotedStr(Label5.Text));
 MyQuery2.Params [0].Value:= 'lunas';
 MyQuery2.ExecSQL;
 MyQuery1.SQL.Clear;
 MyQuery1.SQL.Add('SELECT * FROM dana WHERE keterangan ='+QuotedStr('kas')+' AND status ='+QuotedStr('belum'));
 MyQuery1.Open;
 ShowMessage('Pembayaran Berhasil');
end;

procedure TForm4.Edit1Change(Sender: TObject);
var cari : string;
begin
cari:= '%'+Edit1.Text+'%';
 if Edit1.Text='' then
 begin
   MyQuery1.SQL.Clear;
   MyQuery1.SQL.Add('SELECT * FROM dana WHERE keterangan ='+QuotedStr('kas')+' AND status ='+QuotedStr('belum'));
   MyQuery1.Open;
 end
 else
 begin
   MyQuery1.SQL.Clear;
   MyQuery1.SQL.Add('SELECT * FROM dana WHERE no_dana LIKE '+QuotedStr(cari)+' AND keterangan ='+QuotedStr('kas')+' AND status ='+QuotedStr('belum'));
   MyQuery1.Open;
 end;

end;

procedure TForm4.Rectangle1Click(Sender: TObject);
begin
close;
end;

end.
