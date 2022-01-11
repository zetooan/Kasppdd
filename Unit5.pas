unit Unit5;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, System.Rtti,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, MemDS, DBAccess, MyAccess, FMX.Edit, FMX.Layouts, FMX.Grid;

type
  TForm5 = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    Grid1: TGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label6: TLabel;
    SearchEditButton1: TSearchEditButton;
    MyConnection1: TMyConnection;
    Edit4: TEdit;
    MyQuery1: TMyQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkControlToField1: TLinkControlToField;
    Label5: TLabel;
    MyQuery2: TMyQuery;
    procedure Rectangle1Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.Button1Click(Sender: TObject);
begin
 Edit2.Text:='';
 Edit3.Text:='';
 Edit4.Text:='';
end;

procedure TForm5.Button2Click(Sender: TObject);
var no, bul : string;
begin
  no := FormatDateTime('yyyymmddhhnnss',now);
  bul := FormatDateTime('yyyymm',now);
 if (Edit1.Text='') or (Edit2.Text='') then Label5.Text:='Data Anda Masih Ada yang Kosong'
 else
 begin
   if Edit4.Text='' then
   begin
     MyQuery1.SQL.Clear;
     MyQuery1.SQL.Add('INSERT INTO dana(no_dana, bulan, jumlah, keterangan, Kegiatan) VALUES (:A, :B, :C, :D, :E)');
     MyQuery1.Params [0].Value:=no;
     MyQuery1.Params [1].Value:=bul;
     MyQuery1.Params [2].Value:=StrToInt(Edit2.Text);
     MyQuery1.Params [3].Value:='masuk';
     MyQuery1.Params [4].Value:=Edit1.Text;
     MyQuery1.ExecSQL;
     MyQuery1.SQL.Clear;
     MyQuery1.SQL.Add('SELECT * FROM dana WHERE keterangan ='+QuotedStr('masuk'));
     MyQuery1.Open;
     ShowMessage('Data Berhasil Diinputkan');
   end
   else
   begin
     MyQuery2.SQL.Clear;
     MyQuery2.SQL.Add('UPDATE dana SET jumlah =:A, kegiatan =:B WHERE no_dana ='+QuotedStr(Edit4.Text));
     MyQuery2.Params [0].Value:= StrToInt(Edit2.Text);
     MyQuery2.Params [1].Value:=Edit1.Text;
     MyQuery2.ExecSQL;
     MyQuery1.SQL.Clear;
     MyQuery1.SQL.Add('SELECT * FROM dana WHERE keterangan ='+QuotedStr('masuk'));
     MyQuery1.Open;
     ShowMessage('Data Berhasil Diinputkan');
   end;
 end;

end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  MyQuery1.Delete;
end;

procedure TForm5.Edit3Change(Sender: TObject);
var cari : string;
begin
 cari:='%'+Edit3.Text+'%';
 if Edit3.Text = '' then
 begin
   MyQuery1.SQL.Clear;
   MyQuery1.SQL.Add('SELECT * FROM dana WHERE keterangan ='+QuotedStr('masuk'));
   MyQuery1.Open;
 end
 else
 begin
   MyQuery1.SQL.Clear;
   MyQuery1.SQL.Add('SELECT * FROM dana WHERE kegiatan LIKE '+QuotedStr(cari)+' AND keterangan ='+QuotedStr('masuk'));
   MyQuery1.Open;
 end;

end;

procedure TForm5.Edit4Change(Sender: TObject);
begin
 if Edit4.Text='' then
 begin
   Edit1.Text:='';
   Edit2.Text:='';
 end
 else
 begin
   MyQuery2.SQL.Clear;
   MyQuery2.SQL.Add('SELECT * FROM dana WHERE no_dana ='+QuotedStr(Edit4.Text));
   MyQuery2.Open;

   Edit1.Text:= MyQuery2.FieldByName('kegiatan').AsString;
   Edit2.Text:= MyQuery2.FieldByName('jumlah').AsString;
 end;

end;

procedure TForm5.Rectangle1Click(Sender: TObject);
begin
close;
end;

end.
