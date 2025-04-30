import os
import subprocess
import logging
from datetime import datetime

# 現在のスクリプトのパスを基準にして、実行対象のスクリプトパスを取得
current_dir = os.path.dirname(os.path.abspath(__file__))
create_script = os.path.join(current_dir, "db_doc_create_openpyxl.py")
set_history = os.path.join(current_dir, "db_doc_set_history_openpyxl.py")
set_common = os.path.join(current_dir, "db_doc_set_common_openpyxl.py")
set_table = os.path.join(current_dir, "db_doc_set_table_openpyxl.py")

# ログファイルの設定
log_dir = os.path.join(current_dir, "../output/logs/")
os.makedirs(log_dir, exist_ok=True)  # ログディレクトリを作成

# db_doc_run.py専用のログファイル名を設定
log_file_name = "db_doc_run.log"
log_file_path = os.path.join(log_dir, log_file_name)

# 既存のログファイルをバックアップ
if os.path.exists(log_file_path):
    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    backup_log_file = os.path.join(log_dir, f"bk_{timestamp}_{log_file_name}")
    os.rename(log_file_path, backup_log_file)  # 既存のログファイルをリネームしてバックアップ

# ログ設定
logging.basicConfig(
    filename=log_file_path,
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)

# ログ記録開始
logging.info("db_doc_run.py 実行開始")

# スクリプト実行関数
def run_script(script_path):
    if not os.path.exists(script_path):
        error_message = f"スクリプトが見つかりません: {script_path}"
        print(error_message)
        logging.error(error_message)
        return False
    try:
        logging.info(f"スクリプトを実行中: {script_path}")
        result = subprocess.run(["python3", script_path], capture_output=True, text=True)
        # 実行結果をログと標準出力に記録
        logging.info("=== 実行結果 ===")
        logging.info(result.stdout)
        print("=== 実行結果 ===")
        print(result.stdout)
        # エラーがあればログと標準出力に記録
        if result.stderr:
            logging.error("=== エラー ===")
            logging.error(result.stderr)
            print("=== エラー ===")
            print(result.stderr)
        return True
    except Exception as e:
        error_message = f"スクリプト実行中にエラーが発生しました: {e}"
        print(error_message)
        logging.error(error_message)
        return False

# db_doc_create_openpyxl.py の実行
if run_script(create_script):
    logging.info("db_doc_create_openpyxl.py の実行が完了しました")
else:
    logging.error("db_doc_create_openpyxl.py の実行に失敗しました")
    exit(1)

# db_doc_set_history_openpyxl.py の実行
if run_script(set_history):
    logging.info("db_doc_set_history_openpyxl.py の実行が完了しました")
else:
    logging.error("db_doc_set_history_openpyxl.py の実行に失敗しました")
    exit(1)

# db_doc_set_common_openpyxl.py の実行
if run_script(set_common):
    logging.info("db_doc_set_common_openpyxl.py の実行が完了しました")
else:
    logging.error("db_doc_set_common_openpyxl.py の実行に失敗しました")
    exit(1)

# db_doc_set_table_openpyxl.py の実行
if run_script(set_table):
    logging.info("db_doc_set_table_openpyxl.py の実行が完了しました")
else:
    logging.error("db_doc_set_table_openpyxl.py の実行に失敗しました")
    exit(1)

# ログ記録終了
logging.info("db_doc_run.py 実行終了")
