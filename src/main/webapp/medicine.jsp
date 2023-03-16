<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/script/script.js"></script>
<title>医薬品販売に関するご案内</title>

<link href="css/boostrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/css/terms.css">
</head>
<body>
<div class="wrapper">
<jsp:include page="/header_shop.jsp"/>
<div class="zenbu">
<h1>医薬品販売に関するご案内</h1>
<h3>実店舗の主要な外観と一般用医薬品の陳列状況</h3>
<div class="flex">
<div class="img">

</div>
<div class="tana">
</div>
</div>

<%--一応特定販売なので薬事法的には主要な外観の写真、一般用医薬品の陳列の状況を示す写真必要だけど--%>

<table id="pharmacy-content-table"  class="table table-hover">
            <tbody>
                <tr>
                    <th class="pharmacy-label">許可の区分</th>
                    <td>店舗販売業</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">店舗開設者</th>
                    <td>NAOE株式会社</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">店舗名称</th>
                    <td>NAOEドラッグ岐阜店</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">店舗所在地</th>
                    <td>岐阜市～～0丁目0-0　NAOE岐阜店1階</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">許可番号</th>
                    <td>岐阜市第0000000号</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">許可年月日</th>
                    <td>令和4年1月1日～令和9年12月31日【岐阜市保健所長】</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">特定販売の方法</th>
                    <td>インターネットによる販売</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">店舗管理者の氏名（管理薬剤師名又は、管理登録販売者名）</th>
                    <td>管理薬剤師：山下正樹(OTC販売)</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">当該店舗に勤務する薬剤師又は登録販売者の別及びその氏名、担当業務等</th>
                    <td><p>薬剤師：山下正樹(OTC販売)、平野実千幸(OTC販売)、河原林善文(OTC販売)、森惠子(OTC販売)<br /><br />登録販売者研修中：香村彩花(OTC販売)、新田雪絵(OTC販売)、甲斐綾実(OTC販売)、堀汐里(OTC販売)<br /><br />※OTC販売とは取り扱う医薬品の保管、陳列、販売、情報提供・相談の応需、発送等業務全般を指します。 <br /><br />【当該店舗に勤務する者の名札等による区別に関する説明】 <br />・薬剤師は、長丈の白衣に薬剤師と書いた名札（苗字）をつけています。 <br />・登録販売者は、短丈の制服（ブルー、ピンクまたはグリーン）に登録販売者と書いた名札（苗字）を付けています。 <br />・登録販売者研修中は、短丈の制服（ブルー、ピンクまたはグリーン）に登録販売者研修中と書いた名札（苗字）を付けています。 <br />・一般従事者は、上記以外の着衣に名札（苗字）をつけています。</p></td>
                </tr>
                <tr>
                    <th class="pharmacy-label">取り扱う要指導医薬品及び一般用医薬品の区分</th>
                    <td>要指導医薬品、第1類医薬品、指定第2類医薬品、第2類医薬品、第3類医薬品<br>（特定販売において取り扱う一般用医薬品は、第1類医薬品、指定第2類医薬品、第2類医薬品、第3類医薬品）</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">営業時間、営業時間外で相談できる時間</th>
                    <td>営業時間内は常時店内にて相談をお受けいたします。<br>営業時間 ：9:00～22:00</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">注文のみの受付時間</th>
                    <td>上記の営業時間外は注文のみをお受けします。</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">店舗の開店時間とネットの販売時間</th>
                    <td>店舗の開店時間：9:00～22:00<br>医薬品の販売時間：9:00～22:00<br>ネットの販売時間：9:00～22:00</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">通常相談時及び緊急時の連絡先</th>
                    <td>電話番号：058-0000-0000（代表）（医薬品に関するご質問は上記営業時間内でおうかがいいたします）<br>※お電話でお問い合わせいただく際には、「NAOEネットスーパーで購入のお薬について」 お問い合わせいただいている旨をお話いただけますよう、お願いいたします。</td>
                </tr>
            </tbody>
        </table>
        <div class="section-title"  >
            <h3 class="section-title-text"> 要指導医薬品及び一般用医薬品の販売に関する制度に関する事項</h3>
        </div>
        <table  class="table table-hover">
            <tbody>
                <tr>
                    <th class="pharmacy-label">要指導・第１類～第３類の定義と解説</th>
                    <td>・要指導医薬品・・・副作用等により日常生活に支障を来す程度の健康被害が生ずるおそれがある医薬品のうち、その使用に関し特に注意が必要で、新しく市販された成分等を含むもの<br>・第1類医薬品・・・副作用等により日常生活に支障を来す程度の健康被害が生ずるおそれがある医薬品のうち、その使用に関し特に注意が必要なもの（要指導医薬品を除く）<br>・第2類医薬品・・・副作用等により日常生活に支障を来す程度の健康被害が生ずるおそれがある医薬品（要指導医薬品、第１類医薬品を除く）<br>・指定第2類医薬品・・・第2類医薬品のうち、特別の注意を要する医薬品です。<br>・第3類医薬品･･･第1類医薬品及び第2類医薬品以外の一般用医薬品です。</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">要指導・第１類～第３類の表示</th>
                    <td>・リスク区分ごとに、直接の容器等に次のとおり表示されています。この表示が見えない場合は、外部の容器等にも記載されています。<br />・要指導医薬品は『要指導医薬品』の文字を記載し、枠で囲みます。<br />・第1類医薬品は『第1類医薬品』の文字を記載し、枠で囲みます。<br />・第2類医薬品は『第2類医薬品』の文字を記載し、枠で囲みます。<br />・指定第2類医薬品は『第2類医薬品』の文字を記載し、枠で囲み、さらに『2』の文字を○または□で囲みます。<br />・第3類医薬品は『第3類医薬品』の文字を記載し、枠で囲みます。</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">要指導・第1類～第3類の情報提供及び指導に関する解説</th>
                    <td>・リスク区分ごとに、次のとおり薬剤師又は登録販売者が情報提供及び指導を行います。<br />・要指導医薬品は、薬剤師が対面で書面または出力装置の映像面を用いて情報提供及び指導します（義務）。また、薬剤師が相談に応じます。<br />・第1類医薬品は、薬剤師が書面または出力装置の映像面を用いて情報提供及び指導します（義務）。また、薬剤師が相談に応じます。<br />・第2類医薬品・指定第２類医薬品は、薬剤師又は登録販売者が適正な使用のため必要な情報提供に努めます（努力義務）。また、薬剤師又は登録販売者が相談に応じます。<br />・第3類医薬品は、薬剤師又は登録販売者が相談に応じます。</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">指定第２類の販売サイト上の表示等の解説及び禁忌の確認・専門家への相談を促す表示</th>
                    <td>・商品名に【指定第2類医薬品】と記載します。<br />・医薬品購入にあたっての確認事項に、禁忌(してはいけないこと）の確認・ 薬剤師又は登録販売者への相談を促す表示を記載します。</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">一般用医薬品の販売サイト上の表示の解説</th>
                    <td>・第1類医薬品は商品名に【第1類医薬品】と表示します。<br>  ・指定第2類医薬品は商品名に【指定第2類医薬品】と表示します。<br>  ・第2類医薬品は商品名に【第2類医薬品】と表示します。<br>  ・第3類医薬品は商品名に【第3類医薬品】と表示します。</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">要指導医薬品・一般用医薬品の陳列の解説</th>
                    <td>・要指導医薬品は薬剤師が対面で直接情報提供を行ってから購入頂くために、お客さまが直接手に取れない場所に陳列します。<br />・第1類医薬品は販売時に薬剤師による情報提供を適切に行うため、鍵をかけた場所かお客さまが直接手の触れられない場所に陳列します。<br />・指定第2類医薬品は情報提供の設備から7ｍ以内に陳列し、情報提供の機会を高めます。<br />・第2類医薬品は、許可を受けた医薬品売場内に、要指導、第1類、第3類医薬品、又はその他の商品と区別して陳列します。<br />・第3類医薬品は、許可を受けた医薬品売場内に、要指導、第1類、第2類医薬品、又はその他の商品と区別して陳列します。</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">医薬品による健康被害の救済について</th>
                    <td>くすりの副作用による健康被害には、医薬品副作用救済制度が適用されます。<br />（救済が受けられない医薬品・副作用があります）<br />1）窓口：（独）医薬品医療機器総合機構<br />2）連絡先電話番号： 0120-149-931（フリーダイヤル）<br />3）受付時間：月～金曜日（祝日・年末年始除）9:00～17:00<br />4）ホームページ <a href="http://www.pmda.go.jp/kenkouhigai_camp/index.html" target="_blank"> http://www.pmda.go.jp/kenkouhigai_camp/index.html</a></td>
                </tr>
                <tr>
                    <th class="pharmacy-label">苦情相談窓口について</th>
                    <td>医薬品の購入や使用等について不都合があった場合には、苦情を申し立てることができます。 <br>苦情相談窓口は以下に設置してあります。<br><p>【通常の相談窓口】NAOEドラッグ岐阜店　電話番号：058-0000-0000（代表）<br />【上記で解決しない場合】岐阜市保健所 保健医療課 電話番号：058-252-7197</p></td>
                </tr>
                <tr>
                    <th class="pharmacy-label">販売記録作成に当たっての個人情報利用目的、その他、必要な事項</th>
                    <td>・収集いたしました個人情報は、医薬品適正使用以外の目的では使用しません。<br>・医薬品の正しい注文方法、正しい使用に努めてください。<br>・医薬品の中に入っている「添付文書」は捨てないで、医薬品がある間は保管し、必要に応じて見られるようにしてください。<br>・医薬品は、使用期限が最低5ヶ月以上ある医薬品のみ配達させて頂きます。<br>・厚生労働省の一般用医薬品の販売サイト一覧は<a Href="http://www.mhlw.go.jp/bunya/iyakuhin/ippanyou/hanbailist/index.html" Target="_blank">こちら</a></td>
                </tr>
            </tbody>
        </table>

        <h3 class="widget__title">
                <span>店舗情報</span>
            </h3>

            <div class="widget__content">
                <p>NAOE株式会社<br />NAOE岐阜店<br />〒501-0000<br />岐阜県岐阜市～～0丁目0-0　NAOE岐阜店<br />販売責任者：平賀誠<br />酒類販売管理者：中村充徳<br />酒類販売管理研修の受講実施団体：小売酒販組合<br />受講日：令和4年10月13日 <br /></p>            </div>
                <div class="widget">
            <h3 class="widget__title">
                医薬品は下記店舗にて販売しています。
            </h3>

            <div class="widget__content">
                <p>NAOEドラッグ岐阜店<br />店舗所在地：岐阜市～～0丁目0-0　NAOE岐阜店1階<br />許可番号：岐阜市第0000000号<br />許可年月日：令和4年1月1日～令和9年12月31日【岐阜市保健所長】<br /></p>            </div>
        </div>
        </div>
        <script type="text/javascript"></script>
 <jsp:include page="/footer.jsp"/>
 </div>
</body>
</html>