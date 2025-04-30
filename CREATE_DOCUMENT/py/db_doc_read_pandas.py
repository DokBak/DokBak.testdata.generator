import sys
import os

# 現在のスクリプトのパスを基準にして、相対パスを取得します
current_dir = os.path.dirname(os.path.abspath(__file__))

# ローカルパッケージのパスを追加します
sys.path.append(os.path.join(current_dir, 'packages/openpyxl/'))
sys.path.append(os.path.join(current_dir, 'packages/et_xmlfile/'))

# openpyxlパッケージをインポートします
import openpyxl

# テスト: Openpyxlのバージョンを出力します
print("Openpyxl バージョン:", openpyxl.__version__)

# Excelファイルを作成します
wb = openpyxl.Workbook()
ws = wb.active

# シート名を設定します
ws.title = "Sample Sheet"

# データを追加します
ws.append(["Name", "Age", "City"])
ws.append(["Alice", 30, "New York"])
ws.append(["Bob", 25, "San Francisco"])

# 保存ディレクトリを設定します
output_dir = os.path.join(current_dir, '../document/')
os.makedirs(output_dir, exist_ok=True)  # ディレクトリが存在しない場合、作成します

# Excelファイルの保存パスを設定します
output_file = os.path.join(output_dir, "sample.xlsx")

# 既存ファイルのバックアップ処理
if os.path.exists(output_file):
    backup_file = os.path.join(output_dir, f"bk_sample.xlsx")
    os.rename(output_file, backup_file)  # 既存ファイルをリネームしてバックアップ
    print(f"既存ファイルをバックアップしました: {backup_file}")

# 新しいExcelファイルを保存します
wb.save(output_file)
print(f"エクセルファイルが生成されました: {output_file}")
