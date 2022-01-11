unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB, MemDS,
  DBAccess, MyAccess, FMX.ListBox, FMX.Objects, FMX.StdCtrls, FMX.Layouts,
  FMX.Grid, FMX.Edit, FMX.Controls.Presentation, FMX.ComboEdit, FMX.Colors,
  Fmx.Bind.Grid, Data.Bind.Grid;

type
  TForm3 = class(TForm)
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    BindSourceDB12: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField2: TLinkFillControlToField;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Rectangle1: TRectangle;
    Label5: TLabel;
    Label6: TLabel;
    MyQuery2: TMyQuery;
    ComboEdit1: TComboEdit;
    LinkFillControlToField1: TLinkFillControlToField;
    Label7: TLabel;
    MyQuery3: TMyQuery;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkControlToField1: TLinkControlToField;
    MyQuery4: TMyQuery;
    procedure Rectangle1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboEdit1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
begin
 ComboEdit1.Text:='';
 Label7.Text:='';
 Edit1.Text:='';
 Edit2.Text:='';
 Label6.Text:='';
end;

procedure TForm3.Button2Click(Sender: TObject);
var no, bul : string;
begin
  no := FormatDateTime('yyyymmddhhnnss',now);
  bul := FormatDateTime('yyyymm',now);
 if Label7.Text<>'' then
 begin
  if Edit1.Text='' then Label6.Text:='Jumlah iuran masih kosong'
  else
  begin
   if Edit2.Text='' then
   begin
    MyQuery3.SQL.Clear;
    MyQuery3.SQL.Add('INSERT INTO dana(no_dana, bulan, no_anggota, jumlah, keterangan, status) VALUES (:A, :B, :C, :D, :E, :F)');
    MyQuery3.Params [0].Value:=no;
    MyQuery3.Params [1].Value:=bul;
    MyQuery3.Params [2].Value:=Label7.Text;
    MyQuery3.Params [3].Value:=StrToInt(Edit1.Text);
    MyQuery3.Params [4].Value:='kas';
    MyQuery3.Params [5].Value:='belum';
    MyQuery3.ExecSQL;
    MyQuery3.SQL.Clear;
    MyQuery3.SQL.Add('SELECT * FROM dana WHERE keterangan ='+QuotedStr('kas'));
    MyQuery3.Open;

    ShowMessage('Data Berhasil Dimasukkan');
    ComboEdit1.Text:='';
    Label7.Text:='';
    Edit1.Text:='';
    Edit2.Text:='';
    Label6.Text:='';
   end
   else
   begin
    MyQuery4.SQL.Clear;
    MyQuery4.SQL.Add('UPDATE dana SET jumlah =:A WHERE no_dana ='+QuotedStr(Edit2.Text));
    MyQuery4.Params [0].Value:= StrToInt(Edit1.Text);
    MyQuery4.ExecSQL;
    MyQuery3.SQL.Clear;
    MyQuery3.SQL.Add('SELECT * FROM dana WHERE keterangan ='+QuotedStr('kas'));
    MyQuery3.Open;

    ShowMessage('Data Berhasil Diupdate');
    ComboEdit1.Text:='';
    Label7.Text:='';
    Edit1.Text:='';
    Edit2.Text:='';
    Label6.Text:='';
   end;
  end;
 end
 else Label6.Text:='No Anggota Masih Kosong';
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
 MyQuery3.Delete;
end;

procedure TForm3.ComboEdit1Change(Sender: TObject);
begin
 MyQuery2.SQL.Clear;
 MyQuery2.SQL.Add('SELECT * FROM anggota WHERE username='+QuotedStr(ComboEdit1.Text));
 MyQuery2.Open;

 if MyQuery2.RecordCount<>0 then
 begin
  Label7.Text:=MyQuery2.FieldByName('no_anggota').AsString;
 end
 else Label7.Text:='';

end;


procedure TForm3.Edit2Change(Sender: TObject);
var cari : string;
begin
 cari:= Edit2.Text;
 if Edit2.Text<>'' then
 begin
  MyQuery4.SQL.Clear;
  MyQuery4.SQL.Add('SELECT * FROM dana WHERE no_dana='+QuotedStr(Edit2.Text));
  MyQuery4.Open;

  ComboEdit1.Text:='-- Update Data --';
  Label7.Text:=MyQuery4.FieldByName('no_anggota').AsString;
  Edit1.Text:=MyQuery4.FieldByName('jumlah').AsString;
  Label6.Text:='';

 end;
end;

procedure TForm3.Rectangle1Click(Sender: TObject);
begin
close;
end;

end.
