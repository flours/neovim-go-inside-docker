export GOENV_ROOT="/root/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

source .bashrc
echo "NERDTree <C-f>で開く,<C-t>でトグル、ファイルに合わせた後oで普通に開く、iで隣に開く、sで下に開くよ！"
echo "NERDTreeその2、mでメニューを開いてaで新規作成！"
echo "関数ヘルプ表示は関数名の上でSHIFT K！"

echo "TODO NERDTREEのフォーカスを最初外す！NERDTreeのみになったらvimを閉じる!"
echo "TODO <leader>キーどうなっている？"
echo "TODO find file ,rip grep"

