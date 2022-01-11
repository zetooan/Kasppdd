unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.TabControl,
  FMX.ListBox, Data.DB, MemDS, DBAccess, MyAccess, FMX.Layouts, System.Rtti,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Grid, FMX.DateTimeCtrls;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Edit1: TEdit;
    Rectangle3: TRectangle;
    Edit2: TEdit;
    Rectangle4: TRectangle;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Rectangle5: TRectangle;
    Button1: TButton;
    PasswordEditButton1: TPasswordEditButton;
    Label3: TLabel;
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    Rectangle6: TRectangle;
    Label4: TLabel;
    TabControl2: TTabControl;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    TabItem6: TTabItem;
    ScrollBox1: TScrollBox;
    Label5: TLabel;
    Button2: TButton;
    Label6: TLabel;
    Button3: TButton;
    Button4: TButton;
    Grid1: TGrid;
    MyQuery2: TMyQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Label7: TLabel;
    Button5: TButton;
    Button6: TButton;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Label8: TLabel;
    TabControl3: TTabControl;
    TabItem8: TTabItem;
    TabItem9: TTabItem;
    Button7: TButton;
    Label9: TLabel;
    Label10: TLabel;
    TabItem10: TTabItem;
    Rectangle9: TRectangle;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label18: TLabel;
    Button10: TButton;
    Button11: TButton;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    MyQuery3: TMyQuery;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    MyQuery4: TMyQuery;
    PasswordEditButton2: TPasswordEditButton;
    PasswordEditButton3: TPasswordEditButton;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Label30: TLabel;
    Button16: TButton;
    Rectangle10: TRectangle;
    Rectangle2: TRectangle;
    Rectangle12: TRectangle;
    Rectangle11: TRectangle;
    MyQuery5: TMyQuery;
    BindSourceDB2: TBindSourceDB;
    Label31: TLabel;
    Grid2: TGrid;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Button8: TButton;
    Button17: TButton;
    Label32: TLabel;
    Button9: TButton;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    Label36: TLabel;
    Label37: TLabel;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8;

procedure TForm1.Button10Click(Sender: TObject);
begin
 if (Edit5.Text=Edit6.Text)and(Edit5.Text<>'') then
 begin
   MyQuery4.SQL.Clear;
   MyQuery4.SQL.Add('UPDATE anggota SET password='+QuotedStr(Edit5.Text)+' WHERE no_anggota ='+QuotedStr(Label24.Text));
   MyQuery4.ExecSQL;
   MyQuery4.SQL.Clear;
   ShowMessage('Data Talah Terupdate');
   Edit5.Text:='';
   Edit6.Text:='';
 end
 else Label27.Text:='Data Anda Belum Sesuai atau Masih Kosong';

end;

procedure TForm1.Button11Click(Sender: TObject);
begin
 if (Edit3.Text='')or(Edit4.Text='') then Label26.Text:='Data Anda Masih Ada Yang Kosong'
 else
  begin
    MyQuery3.SQL.Clear;
    MyQuery3.SQL.Add('SELECT * FROM anggota WHERE username ='+QuotedStr(Edit3.Text));
    MyQuery3.Open;
       if MyQuery1.RecordCount<=1  then
       begin
        MyQuery4.SQL.Clear;
        MyQuery4.SQL.Add('UPDATE anggota SET username='+QuotedStr(Edit3.Text)+',no_hp='+QuotedStr(Edit4.Text)+' WHERE no_anggota ='+QuotedStr(Label24.Text));
        MyQuery4.ExecSQL;
        MyQuery4.SQL.Clear;

        MyQuery3.SQL.Clear;

        ShowMessage('Data Talah Terupdate');
       end
      else Label26.Text:='Username Sudah ada';
  end;

end;

procedure TForm1.Button12Click(Sender: TObject);
begin
 MyQuery3.SQL.Clear;
 MyQuery3.SQL.Add('SELECT * FROM anggota WHERE no_anggota='+QuotedStr(Label28.Text));
 MyQuery3.Open;

 Label24.Text:= MyQuery3.FieldByName('no_anggota').AsString;
 Label25.Text:= MyQuery3.FieldByName('jabatan').AsString;
 Edit3.Text:= MyQuery3.FieldByName('username').AsString;
 Edit4.Text:= MyQuery3.FieldByName('no_hp').AsString;

 TabControl1.ActiveTab:=TabItem10;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
 TabControl1.ActiveTab:=TabItem1;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
 form7.showmodal;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
 ShowMessage('Silahkan Buka Cetak.exe');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
username, password, jabatan : string;
jum : Integer;
begin
//memasukkan data
username := Edit1.Text;
password := Edit2.Text;
if combobox1.ItemIndex=-1 then jabatan := ''
else if combobox1.ItemIndex=0 then jabatan := 'Anggota'
else if combobox1.ItemIndex=1 then jabatan := 'Admin';

//validasi login
if (username = '') or (password ='') or (jabatan='') then Label3.Text := 'data anda ada yang belum terisi'
else
  begin
      MyQuery1.SQL.Clear;
      MyQuery1.SQL.Add('SELECT * FROM anggota WHERE username='+QuotedStr(Edit1.Text));
      MyQuery1.Open;
      if MyQuery1.RecordCount = 0 then Label3.Text:='Username anda tidak ditemukan'
      else if MyQuery1.FieldByName('password').AsString<>password then Label3.Text:='Kombinasi Salah'
      else if MyQuery1.FieldByName('jabatan').AsString<>jabatan then Label3.Text:='Kombinasi Salah'
      else
        begin
        if jabatan='Admin' then
         begin
         TabControl2.ActiveTab:=TabItem4;
         TabControl1.ActiveTab:=TabItem2;
         Label9.Text:= MyQuery1.FieldByName('no_anggota').AsString;
         Label10.Text:= MyQuery1.FieldByName('username').AsString;

         Edit1.Text:='';
         Edit2.Text:='';
         Label3.Text:='';
         end
        else
        begin
        TabControl1.ActiveTab:=TabItem3;
        TabControl3.ActiveTab:=TabItem8;
        Label28.Text:= MyQuery1.FieldByName('no_anggota').AsString;
        Label29.Text:= MyQuery1.FieldByName('username').AsString;

        MyQuery5.SQL.Clear;
        MyQuery5.SQL.Add('SELECT no_dana, no_anggota, jumlah, status FROM dana WHERE no_anggota ='+QuotedStr(Label28.text)+' AND keterangan ='+QuotedStr('kas')+' AND status ='+QuotedStr('belum'));
        MyQuery5.Open;

         Edit1.Text:='';
         Edit2.Text:='';
         Label3.Text:='';
        end;
        end;



  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form2.showmodal;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
form3.showmodal;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
form4.showmodal;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
form5.showmodal;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
form6.showmodal;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 MyQuery3.SQL.Clear;
 MyQuery3.SQL.Add('SELECT * FROM anggota WHERE no_anggota='+QuotedStr(Label9.Text));
 MyQuery3.Open;

 Label24.Text:= MyQuery3.FieldByName('no_anggota').AsString;
 Label25.Text:= MyQuery3.FieldByName('jabatan').AsString;
 Edit3.Text:= MyQuery3.FieldByName('username').AsString;
 Edit4.Text:= MyQuery3.FieldByName('no_hp').AsString;

 TabControl1.ActiveTab:=TabItem10;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 ShowMessage('Silahkan Menghubungi Admin Jika Akan Melakukan Pembayaran');
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
 TabControl1.ActiveTab:=TabItem1;
end;

procedure TForm1.Rectangle9Click(Sender: TObject);
begin
if Label25.Text='Admin' then TabControl1.ActiveTab:=TabItem2
else TabControl1.ActiveTab:=TabItem3;
end;

end.
