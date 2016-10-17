:: Basic認証でリポジトリ情報を取得するときのcURLのパラメータを設定する。
:: 
:: 引数一覧
:: %1 ユーザ名
:: %2 パスワード
:: 
:: 出力変数一覧（呼出元で以下の名前の変数を用意しておくこと）
::   API_ENTRY_POINT
::   CURL_PARAM_AUTH
set API_ENTRY_POINT=/user/repos?
set CURL_PARAM_AUTH= -u "%1:%2"
