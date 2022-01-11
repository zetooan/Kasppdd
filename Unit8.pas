unit Unit8;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, Data.DB, DBAccess,
  MyAccess, FMX.Layouts, MemDS, FMX.ListBox;

type
  TForm8 = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    MyConnection1: TMyConnection;
    Label2: TLabel;
    Tahun: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Button1: TButton;
    MyQuery1: TMyQuery;
    MyQuery2: TMyQuery;
    MyQuery3: TMyQuery;
    Label3: TLabel;
    procedure Rectangle1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}

procedure TForm8.Button1Click(Sender: TObject);
var
bln, blncari : string;
thn : Integer;
begin
 if (ComboBox1.ItemIndex = -1) or (ComboBox2.ItemIndex = -1) then Label3.Text:='Data Anda Masih kosong'
 else
 begin
   if ComboBox1.ItemIndex <= 10 then bln:= '0'+IntToStr(ComboBox1.ItemIndex)
   else bln:= IntToStr(ComboBox1.ItemIndex);
   thn := 2020+ComboBox2.ItemIndex;
   blncari := IntToStr(thn)+bln;

   MyQuery1.SQL.Clear;
   MyQuery1.SQL.Add('SELECT no_dana, bulan, no_anggota, jumlah FROM dana WHERE status ='+QuotedStr('lunas'));
   MyQuery1.Open;

   MyQuery2.SQL.Clear;
   MyQuery2.SQL.Add('SELECT no_dana, bulan, kegiatan, jumlah FROM dana WHERE keterangan ='+QuotedStr('masuk'));
   MyQuery2.Open;

   MyQuery3.SQL.Clear;
   MyQuery3.SQL.Add('SELECT no_dana, bulan, kegiatan, jumlah FROM dana WHERE keterangan ='+QuotedStr('keluar'));
   MyQuery3.Open;
 end;

end;

procedure TForm8.Rectangle1Click(Sender: TObject);
begin
close;
end;

end.
