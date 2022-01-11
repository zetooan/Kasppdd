object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cetak Rekap'
  ClientHeight = 152
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 27
    Width = 82
    Height = 13
    Caption = 'Bulan'
  end
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 30
    Height = 13
    Caption = 'Tahun'
  end
  object ComboBox1: TComboBox
    Left = 64
    Top = 24
    Width = 49
    Height = 21
    TabOrder = 0
    Text = '01'
    Items.Strings = (
      '01'
      '02'
      '03'
      '04'
      '05'
      '06'
      '07'
      '08'
      '09'
      '10'
      '11'
      '12')
  end
  object ComboBox2: TComboBox
    Left = 64
    Top = 51
    Width = 65
    Height = 21
    TabOrder = 1
    Text = '2021'
    Items.Strings = (
      '2020'
      '2021'
      '2022'
      '2023'
      '2024'
      '2025'
      '2026'
      '2027'
      '2028'
      '2029'
      '2030')
  end
  object Button1: TButton
    Left = 167
    Top = 8
    Width = 97
    Height = 75
    Caption = 'Buat Rekap'
    TabOrder = 2
    OnClick = Button1Click
  end
  object MyConnection1: TMyConnection
    Database = 'ppdd_kas'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 80
  end
  object MyQuery1: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      
        'SELECT no_dana, bulan, no_anggota, jumlah FROM dana WHERE status' +
        ' = '#39'lunas'#39)
    Active = True
    Left = 112
    Top = 96
  end
  object MyQuery2: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      
        'SELECT no_dana, bulan, kegiatan, jumlah FROM dana WHERE keterang' +
        'an = '#39'masuk'#39)
    Active = True
    Left = 160
    Top = 88
  end
  object MyQuery3: TMyQuery
    Connection = MyConnection1
    SQL.Strings = (
      
        'SELECT no_dana, bulan, kegiatan, jumlah FROM dana WHERE keterang' +
        'an = '#39'keluar'#39)
    Active = True
    Left = 240
    Top = 88
  end
  object frxReport1: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44552.492854421300000000
    ReportOptions.LastChange = 44552.520998981480000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 128
    Top = 8
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end
      item
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 58.000000000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baClient
          Width = 740.409927000000000000
          Height = 58.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'LAPORAN KAS PPDD')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 19.677180000000000000
        Top = 226.771800000000000000
        Width = 740.409927000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 9.000000000000000000
          Top = 0.243970000000000000
          Width = 63.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 73.000000000000000000
          Top = 0.243970000000000000
          Width = 128.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."no_dana"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 375.000000000000000000
          Top = 0.362090000000000000
          Width = 169.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."no_anggota"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 201.000000000000000000
          Top = 0.362090000000000000
          Width = 174.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."no_dana"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 544.000000000000000000
          Top = 0.362090000000000000
          Width = 132.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."jumlah"]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 67.897650000000000000
        Top = 136.063080000000000000
        Width = 740.409927000000000000
        RowCount = 1
        object Memo2: TfrxMemoView
          Left = 9.000000000000000000
          Top = 49.000000000000000000
          Width = 62.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'no')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 71.000000000000000000
          Top = 49.000000000000000000
          Width = 129.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Bulan')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 201.000000000000000000
          Top = 49.000000000000000000
          Width = 172.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'No Dana / Iuran')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 374.000000000000000000
          Top = 49.000000000000000000
          Width = 170.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'No Anggota')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 544.000000000000000000
          Top = 49.000000000000000000
          Width = 132.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Jumlah')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 12.000000000000000000
          Top = 18.936920000000000000
          Width = 225.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Pemasukan Kas')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        Height = 67.897650000000000000
        Top = 268.346630000000000000
        Width = 740.409927000000000000
        RowCount = 1
        object Memo13: TfrxMemoView
          Left = 9.000000000000000000
          Top = 49.000000000000000000
          Width = 62.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'no')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 71.000000000000000000
          Top = 49.000000000000000000
          Width = 129.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Bulan')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 201.000000000000000000
          Top = 49.000000000000000000
          Width = 172.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'No Dana / Iuran')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 374.000000000000000000
          Top = 49.000000000000000000
          Width = 170.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Kegiatan')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 544.000000000000000000
          Top = 49.000000000000000000
          Width = 132.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Jumlah')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 12.000000000000000000
          Top = 18.936920000000000000
          Width = 225.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Pemasukan Lainnya')
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        FillType = ftBrush
        Height = 19.677180000000000000
        Top = 359.055350000000000000
        Width = 740.409927000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo19: TfrxMemoView
          Left = 9.000000000000000000
          Top = 0.243970000000000000
          Width = 63.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 73.000000000000000000
          Top = 0.243970000000000000
          Width = 128.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."bulan"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 375.000000000000000000
          Top = 0.362090000000000000
          Width = 169.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."kegiatan"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 201.000000000000000000
          Top = 0.362090000000000000
          Width = 174.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."no_dana"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 544.000000000000000000
          Top = 0.362090000000000000
          Width = 132.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."jumlah"]')
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        FillType = ftBrush
        Height = 67.897650000000000000
        Top = 400.630180000000000000
        Width = 740.409927000000000000
        RowCount = 1
        object Memo24: TfrxMemoView
          Left = 9.000000000000000000
          Top = 49.000000000000000000
          Width = 62.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'no')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 71.000000000000000000
          Top = 49.000000000000000000
          Width = 129.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Bulan')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 201.000000000000000000
          Top = 49.000000000000000000
          Width = 172.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'No Dana / Iuran')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 374.000000000000000000
          Top = 49.000000000000000000
          Width = 170.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Kegiatan')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 544.000000000000000000
          Top = 49.000000000000000000
          Width = 132.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Jumlah')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 12.000000000000000000
          Top = 18.936920000000000000
          Width = 225.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Pengeluaran Kas')
          ParentFont = False
        end
      end
      object MasterData6: TfrxMasterData
        FillType = ftBrush
        Height = 19.677180000000000000
        Top = 491.338900000000000000
        Width = 740.409927000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo30: TfrxMemoView
          Left = 9.000000000000000000
          Top = 0.243970000000000000
          Width = 63.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 73.000000000000000000
          Top = 0.243970000000000000
          Width = 128.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset3."bulan"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 375.000000000000000000
          Top = 0.362090000000000000
          Width = 169.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset3."kegiatan"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 201.000000000000000000
          Top = 0.362090000000000000
          Width = 174.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset3."no_dana"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 544.000000000000000000
          Top = 0.362090000000000000
          Width = 132.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset3."jumlah"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = MyQuery1
    BCDToCurrency = False
    Left = 16
    Top = 120
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = MyQuery2
    BCDToCurrency = False
    Left = 192
    Top = 88
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    DataSet = MyQuery3
    BCDToCurrency = False
    Left = 256
    Top = 128
  end
end
