 // ページ数を取得
            var page = Number(getQueryParam('page'));
            if (page < 1) page = 1;
            count = 1015;
            perPage = 20;
            maxPage = Math.ceil(count / perPage) // 51
 
            // コンテンツ
            var html = '<thead><tr><th>ID</th><th scope="col">Content</th></tr></thead>';
            var i;
            for (i = (page - 1) * perPage + 1; i <= page * perPage && i <= count; i++) {
                html += `<tbody><tr><th scope="row">${i}</th><td>これは${i}番目のコンテンツです。</td></tr>`;
            }
            document.getElementById('container').innerHTML = html;
 
            // ページネーション
            html = '';
            if (page > 1) {
                html += `<li class="page-item"><a class="page-link" href="?page=${page - 1}">前へ</a></li>`;
            }
            for (i = page - 2; i <= page + 2 && i <= maxPage; i++) {
                if (i < 1) continue;
                if (i == page) {
                    html += `<li class="page-item active"><a class="page-link" href="?page=${i}">${i}</a></li>`;
                    continue;
                }
                html += `<li class="page-item"><a class="page-link" href="?page=${i}">${i}</a></li>`;
            }
            if (page != maxPage) {
                html += `<li class="page-item"><a class="page-link" href="?page=${page + 1}">次へ</a></li>`
            }
            document.getElementById('pagination').innerHTML = html;
 
            // URLから指定したパラメータを取得
            function getQueryParam($key) {
                if (1 < document.location.search.length) {
                    var query = document.location.search.substring(1);
                    var parameters = query.split('&');
                    for (var i = 0; i < parameters.length; i++) {
                        // パラメータ名とパラメータ値に分割する
                        var element = parameters[i].split('=');
                        if (element[0] == $key) return element[1];
                    }
                }
                return null;
            }