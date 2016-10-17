:: GitHubAPI�ɂă��|�W�g�������擾����
:: 
:: �����ꗗ
:: %1 ���[�U��
:: 
:: ����
::   [���N�G�X�g���](https://developer.github.com/v3/#rate-limiting)
::     �F�؂Ȃ��ōs�����߁A1���Ԃ�����60���N�G�X�g�����ł��Ȃ��B
::   [�擾����](https://developer.github.com/v3/#pagination)
::     per_page�̒l * 30�B
::     per_page=1000�Ȃ�A30000���̃��|�W�g�������擾�ł���B
@echo off

set Username=YourUsername

:: TSV�t�@�C�����烆�[�U����Scope�ōi�荞���AccessToken���擾����
:: scope��csv�`���Ȃ̂ŁA���̒���repo���܂܂�Ă��邩���肷��c�̂͂ނ����������B
set q="C:\root\tool\System\q-1.5.0\bin\q.bat"
set TSV_TOKEN=AccessToken.tsv
set TokenDescription=RepositoryControl
FOR /F "usebackq" %%i in (`call %q% -H -t -e UTF-8 -E SJIS "select Token from %TSV_TOKEN% where User == '%Username%' and Description == '%TokenDescription%'"`) DO set AccessToken=%%i

set CURL_PEM="C:\Program Files\Git\ssl\certs\cacert.pem"
set SAVE_FILE="./GitHub.%Username%.Repositories.json"
set API_PARAM="type=owner&sort=created&direction=desc&per_page=1000"
set HDR_TIMEZONE="Time-Zone: Asia/Tokyo"

set API_URL_BASE=https://api.github.com
set API_PARAM="type=owner&sort=created&direction=desc&per_page=1000"

:: �ϐ���錾���Ă����iCURL_PARAM��ݒ肷��o�b�`���Ăяo���O�ɐ錾���邱�ƂŌďo���Ŏ󂯎���j
set API_ENTRY_POINT=
set CURL_PARAM_AUTH=

:: CURL_PARAM��ݒ肷��
::call SetCurlParamCaseNonAuth.bat %Username%
::call SetCurlParamCaseBasicAuth.bat %Username% %Password%
call SetCurlParamCaseTokenAuth.bat %AccessToken%

curl -o %SAVE_FILE% --cacert %CURL_PEM% -H %HDR_TIMEZONE% %CURL_PARAM_AUTH% %API_URL_BASE%%API_ENTRY_POINT%%API_PARAM%

pause
@echo on
