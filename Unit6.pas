unit Unit6;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Layouts, FMX.Grid, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Edit, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Data.DB, MemDS, DBAccess, MyAccess;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Rectangle1: TRectangle;
    Grid1: TGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SearchEditButton1: TSearchEditButton;
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    MyQuery2: TMyQuery;
    LinkControlToField1: TLinkControlToField;
    procedure Rectangle1Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

procedure TForm6.Button1Click(Sender: TObject);
begin
 Edit3.Text:='';
end;

procedure TForm6.Button2Click(Sender: TObject);
var no, bul : string;
begin
  no := FormatDateTime('yyyymmddhhnnss',now);
  bul := FormatDateTime('yyyymm',now);
 if (Edit1.Text='') or (Edit2.Text='') then Label5.Text:='Data Anda Masih Ada yang Kosong'
 else
 begin
   if Edit3.Text='' then
   begin
     MyQuery1.SQL.Clear;
     MyQuery1.SQL.Add('INSERT INTO dana(no_dana, bulan, jumlah, keterangan, Kegiatan) VALUES (:A, :B, :C, :D, :E)');
     MyQuery1.Params [0].Value:=no;
     MyQuery1.Params [1].Value:=bul;
     MyQuery1.Params [2].Value:=StrToInt(Edit2.Text);
     MyQuery1.Params [3].Value:='keluar';
     MyQuery1.Params [4].Value:=Edit1.Text;
     MyQuery1.ExecSQL;
     MyQuery1.SQL.Clear;
     MyQuery1.SQL.Add('SELECT * FROM dana WHERE keterangan ='+QuotedStr('keluar'));
     MyQuery1.Open;
     ShowMessage('Data Berhasil Diinputkan');
   end
   else
   begin
     MyQuery2.SQL.Clear;
     MyQuery2.SQL.Add('UPDATE dana SET jumlah =:A, kegiatan =:B WHERE no_dana ='+QuotedStr(Edit3.Text));
     MyQuery2.Params [0].Value:= StrToInt(Edit2.Text);
     MyQuery2.Params [1].Value:=Edit1.Text;
     MyQuery2.ExecSQL;
     MyQuery1.SQL.Clear;
     MyQuery1.SQL.Add('SELECT * FROM dana WHERE keterangan ='+QuotedStr('keluar'));
     MyQuery1.Open;
     ShowMessage('Data Berhasil Diinputkan');
   end;
 end;

end;

procedure TForm6.Button3Click(Sender: TObject);
begin
MyQuery1.Delete;
ShowMessage('Data Berhasil dihapus');
end;

procedure TForm6.Edit3Change(Sender: TObject);
begin
 if Edit3.Text='' then
 begin
   Edit1.Text:='';
   Edit2.Text:='';
 end
 else
 begin
   MyQuery2.SQL.Clear;
   MyQuery2.SQL.Add('SELECT * FROM dana WHERE no_dana ='+QuotedStr(Edit3.Text));
   MyQuery2.Open;

   Edit1.Text:= MyQuery2.FieldByName('kegiatan').AsString;
   Edit2.Text:= MyQuery2.FieldByName('jumlah').AsString;
 end;
end;

procedure TForm6.Edit4Change(Sender: TObject);
var cari : string;
begin
 cari:='%'+Edit4.Text+'%';
 if Edit4.Text = '' then
 begin
   MyQuery1.SQL.Clear;
   MyQuery1.SQL.Add('SELECT * FROM dana WHERE keterangan ='+QuotedStr('keluar'));
   MyQuery1.Open;
 end
 else
 begin
   MyQuery1.SQL.Clear;
   MyQuery1.SQL.Add('SELECT * FROM dana WHERE kegiatan LIKE '+QuotedStr(cari)+' AND keterangan ='+QuotedStr('keluar'));
   MyQuery1.Open;
 end;
end;

procedure TForm6.Rectangle1Click(Sender: TObject);
begin
  close;
end;

end.
