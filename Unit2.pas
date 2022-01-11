unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.TabControl,
  FMX.Edit, FMX.Layouts, Data.DB, MemDS, DBAccess, MyAccess, System.Rtti,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Grid;

type
  TForm2 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Rectangle3: TRectangle;
    Label3: TLabel;
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    ScrollBox1: TScrollBox;
    Rectangle5: TRectangle;
    Edit1: TEdit;
    SearchEditButton1: TSearchEditButton;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Rectangle4: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Label4: TLabel;
    Label5: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    Label6: TLabel;
    Label7: TLabel;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit2: TEdit;
    Label12: TLabel;
    Edit3: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Button4: TButton;
    MyQuery2: TMyQuery;
    Label17: TLabel;
    PasswordEditButton1: TPasswordEditButton;
    PasswordEditButton2: TPasswordEditButton;
    Label18: TLabel;
    Label19: TLabel;
    Edit6: TEdit;
    Username: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    PasswordEditButton3: TPasswordEditButton;
    PasswordEditButton4: TPasswordEditButton;
    Label26: TLabel;
    Button5: TButton;
    procedure Rectangle1Click(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
begin
 Edit6.Text:=Label5.Text;
 TabControl1.ActiveTab:=TabItem3;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 MyQuery1.Delete;
 ShowMessage('Data Berhasil Dihapus');
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
 TabControl1.ActiveTab:=TabItem2;
 Edit2.Text:='';
 Edit3.Text:='';
 Edit4.Text:='';
 Edit5.Text:='';
 Label17.Text:='';
end;

procedure TForm2.Button4Click(Sender: TObject);
var noAnggota : string;
begin
 noAnggota:= FormatDateTime('yyyymmddhhnnss',now);
 if (Edit2.Text='')or(Edit3.Text='')or(Edit4.Text='')or(Edit5.Text='') then Label17.Text:='Data Anda Masih Ada Yang Kosong'
 else
  begin
   MyQuery1.SQL.Clear;
   MyQuery1.SQL.Add('SELECT * FROM anggota WHERE jabatan ='+QuotedStr('Anggota')+' AND username ='+QuotedStr(Edit2.Text));
   MyQuery1.Open;
   if MyQuery1.RecordCount=0 then
   begin
    if Edit4.Text=Edit5.Text then
    begin
     MyQuery2.SQL.Clear;
     MyQuery2.SQL.Add('INSERT INTO anggota(no_anggota, username, no_hp, password, jabatan) VALUES (:A, :B, :C, :D, :E)');
     MyQuery2.Params [0].Value:= noAnggota;
     MyQuery2.Params [1].Value:= Edit2.Text;
     MyQuery2.Params [2].Value:= Edit3.Text;
     MyQuery2.Params [3].Value:= Edit4.Text;
     MyQuery2.Params [4].Value:= 'Anggota';
     MyQuery2.ExecSQL;
     MyQuery2.SQL.Clear;

     MyQuery1.SQL.Clear;
     MyQuery1.SQL.Add('SELECT * FROM anggota WHERE jabatan ='+QuotedStr('Anggota'));
     MyQuery1.Open;

     TabControl1.ActiveTab:=TabItem1;
     ShowMessage('Data Talah Tersimpan');
    end
    else Label17.Text:='Password Anda Tidak Sinkron';
   end
   else Label17.Text:= 'Username Sudah Ada';
  end;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  if (Edit7.Text='')or(Edit8.Text='') then Label26.Text:='Data Anda Masih ada Yang Kosong'
  else
  begin
    if Edit9.Text<>'' then
    begin
      if Edit9.Text=Edit10.Text then
      begin
       MyQuery1.SQL.Clear;
       MyQuery1.SQL.Add('SELECT * FROM anggota WHERE jabatan ='+QuotedStr('Anggota')+' AND username ='+QuotedStr(Edit2.Text));
       MyQuery1.Open;

       if MyQuery1.RecordCount<=1  then
       begin
        MyQuery2.SQL.Clear;
        MyQuery2.SQL.Add('UPDATE anggota SET username='+QuotedStr(Edit7.Text)+',no_hp='+QuotedStr(Edit8.Text)+', password='+QuotedStr(Edit9.Text)+' WHERE no_anggota ='+QuotedStr(Edit6.Text));
        MyQuery2.ExecSQL;
        MyQuery2.SQL.Clear;

        MyQuery1.SQL.Clear;
        MyQuery1.SQL.Add('SELECT * FROM anggota WHERE jabatan ='+QuotedStr('Anggota'));
        MyQuery1.Open;

        Edit6.Text:='';
        TabControl1.ActiveTab:=TabItem1;
        ShowMessage('Data Talah Terupdate');
       end
      else Label26.Text:='Username Sudah ada';
      end
      else Label26.Text:='Password anda Tidak Sinkron';
    end
    else
    begin
     MyQuery1.SQL.Clear;
     MyQuery1.SQL.Add('SELECT * FROM anggota WHERE jabatan ='+QuotedStr('Anggota')+' AND username ='+QuotedStr(Edit2.Text));
     MyQuery1.Open;

     if MyQuery1.RecordCount<=1  then
     begin
      MyQuery2.SQL.Clear;
      MyQuery2.SQL.Add('UPDATE anggota SET username='+QuotedStr(Edit7.Text)+',no_hp='+QuotedStr(Edit8.Text)+' WHERE no_anggota ='+QuotedStr(Edit6.Text));
      MyQuery2.ExecSQL;
      MyQuery2.SQL.Clear;

      MyQuery1.SQL.Clear;
      MyQuery1.SQL.Add('SELECT * FROM anggota WHERE jabatan ='+QuotedStr('Anggota'));
      MyQuery1.Open;

      Edit6.Text:='';
      TabControl1.ActiveTab:=TabItem1;
      ShowMessage('Data Talah Terupdate');
     end
     else Label26.Text:='Username Sudah ada';
    end;
  end;
end;

procedure TForm2.Edit1Change(Sender: TObject);
var cari : string;
begin
  cari := '%'+Edit1.Text+'%';
  if Edit1.Text<>'' then
  begin
    MyQuery1.SQL.Clear;
    MyQuery1.SQL.Add('SELECT * FROM anggota WHERE (username LIKE '+QuotedStr(cari)+' OR no_anggota LIKE '+QuotedStr(cari)+') AND (jabatan ='+QuotedStr('Anggota')+')');
    MyQuery1.Open;
  end
  else
  begin
    MyQuery1.SQL.Clear;
    MyQuery1.SQL.Add('SELECT * FROM anggota WHERE jabatan ='+QuotedStr('Anggota'));
    MyQuery1.Open;
  end;
end;

procedure TForm2.Edit6Change(Sender: TObject);
begin
 if Edit6.Text='' then
 begin
  MyQuery1.SQL.Clear;
  MyQuery1.SQL.Add('SELECT * FROM anggota WHERE jabatan ='+QuotedStr('Anggota'));
  MyQuery1.Open;

  Edit7.Text:='';
  Edit8.Text:='';
  Edit9.Text:='';
  Edit10.Text:='';
 end
 else
 begin
  MyQuery1.SQL.Clear;
  MyQuery1.SQL.Add('SELECT * FROM anggota WHERE no_anggota ='+QuotedStr(Edit6.Text));
  MyQuery1.Open;

  Edit7.Text:=MyQuery1.FieldByName('username').AsString;
  Edit8.Text:=MyQuery1.FieldByName('no_hp').AsString;
  Edit9.Text:='';
  Edit10.Text:='';
 end;
end;

procedure TForm2.Rectangle1Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.Rectangle2Click(Sender: TObject);
begin
  TabControl1.ActiveTab:=TabItem1;
  MyQuery1.SQL.Clear;
  MyQuery1.SQL.Add('SELECT * FROM anggota WHERE jabatan ='+QuotedStr('Anggota'));
  MyQuery1.Open;
end;

procedure TForm2.Rectangle3Click(Sender: TObject);
begin
  TabControl1.ActiveTab:=TabItem1;
  MyQuery1.SQL.Clear;
  MyQuery1.SQL.Add('SELECT * FROM anggota WHERE jabatan ='+QuotedStr('Anggota'));
  MyQuery1.Open;

  Edit6.Text:='';
end;
end.
