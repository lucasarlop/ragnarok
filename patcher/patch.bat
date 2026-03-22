@echo off
:: FoxHT Patch v3 - Fixes + Traducao EN
:: Este arquivo e baixado e executado pelo launcher automaticamente

set "REPO=https://raw.githubusercontent.com/lucasarlop/ragnarok/main"

echo  [1/4] Corrigindo crash na janela de Skills (ALT+S)...
del /q "data\skilltreeview.txt" 2>nul
del /q "data\luafiles514\lua files\skillinfoz\skilldescript.lub" 2>nul
del /q "data\luafiles514\lua files\skillinfoz\skillinfolist.lub" 2>nul
del /q "data\luafiles514\lua files\skillinfoz\skilltreeview.lub" 2>nul
del /q "data\luafiles514\lua files\skillinfoz\skillid.lub" 2>nul
del /q "data\lua files\skillinfoz\skilldescript.lub" 2>nul
del /q "data\lua files\skillinfoz\skillinfolist.lub" 2>nul
del /q "data\lua files\skillinfoz\skilltreeview.lub" 2>nul

echo  [2/4] Corrigindo erro de Quest em alguns mapas...
if not exist "data\luafiles514\lua files\datainfo" mkdir "data\luafiles514\lua files\datainfo"
(
echo -- FoxHT: Fixed QuestInfo_f.lua for Pre-Renewal
echo function GetOngoingQuestInfoByID^(questID^)
echo     local questInfo = QuestTable[questID]
echo     if questInfo == nil then return "" end
echo     return questInfo
echo end
echo function GetQuestInfoByID^(questID^)
echo     local questInfo = QuestTable[questID]
echo     if questInfo == nil then return "" end
echo     return questInfo
echo end
) > "data\luafiles514\lua files\datainfo\QuestInfo_f.lua"

echo  [3/4] Baixando traducao de skills (EN)...
curl -s -f "%REPO%/client/data/skillnametable.txt" -o "data\skillnametable.txt" 2>nul
curl -s -f "%REPO%/client/data/skilldesctable.txt" -o "data\skilldesctable.txt" 2>nul

echo  [4/4] Baixando traducao de itens (EN)...
curl -s -f "%REPO%/client/data/iteminfo.lua" -o "data\luafiles514\lua files\datainfo\iteminfo.lua" 2>nul

echo  Patches aplicados!
