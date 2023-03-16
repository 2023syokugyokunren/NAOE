<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/css/terms.css">
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/script/script.js"></script>
<title>特定商取引法に基づく表記</title>
</head>
<body>
<div class="wrapper">
<jsp:include page="/header_shop.jsp"/>

<div class="zenbu">
<h1>特定商取引法に基づく表記</h1>
        <table id="pharmacy-content-table" class="table table-hover">
            <tbody>
                <tr>
                    <th class="pharmacy-label">販売業者</th>
                    <td>NAOE株式会社 (NAOE岐阜）</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">販売責任者名</th>
                    <td>○○</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">所在地</th>
                    <td>266-0031<br>岐阜県岐阜市～～0丁目0-0</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">お問い合わせ先</th>
                    <td>NAOEネットスーパー カスタマーサポートセンター 0120-000-000（受付時間 9：00～21：00）</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">販売価格</th>
                    <td>
                        本サイトのご注文ページにて表示する価格<br>
                        ※　本価格は登録店舗のネットスーパー価格であり、実店舗の価格又は他店舗の価格とは異なる場合があります。　　　<br>
                        　&nbsp;&nbsp;本価格は、一部の商品を除き、本体価格と消費税を加えた税込価格とさせていただいております。<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;価格は、お届けする商品に添付された値札ラベル等に記載の価格とは異なる場合があります。
                    </td>
                </tr>

                <tr>
                    <th class="pharmacy-label">代金の支払い方法・時期</th>
                    <td>
                        お支払い方法<br>
                        NAOEポイント決済、代金引き換えのいずれかをお選びいただけます。<br>
                        ※　一部店舗では上記お支払い方法をお選びいただけない場合がございます<br>



                    </td>
                </tr>
                <tr>
                    <th class="pharmacy-label">商品の引渡し時期</th>
                    <td>お客さまのご指定に従いお届けとなります。※予約商品につきましては、指定商品期間のお届けになります。</td>
                </tr>
                <tr>
                    <th class="pharmacy-label">返品・キャンセルの対応</th>
                    <td>

商品に瑕疵があった場合や注文と異なる商品が配達された場合は、再度 、商品を配送させていただきます。<BR>
その場合の配送料については、ネットスーパー会員の負担はありません。<br>



商品に瑕疵があった場合や注文と異なる商品が配送された場合には、配送日から8日以内にNAOEネットスーパーカスタマーサポートセンターまでご連絡いただきますようお願いいたします。配送日から8日を過ぎた場合は、ご対応できない場合がございます。<br>



原則として、お客さま都合による返品・交換は致しかねます。<br>



お客さま都合による返品の場合には商品が当社に到着後、当社の定める手続きに従って返金を行います。<br>



ただし、返品・返金に必要な費用は控除させていただくものとします。返金の時期についても当社の合理的な裁量の範囲内とさせていただき、お支払いから返金までの間の利息は付さないものとします。
                    </td>
                </tr>
                <tr>
                    <th>ご注文商品の品切れについて</th>
                    <td>
                        (1)当社は、商品鮮度管理その他の理由より、ご注文時間に関わらず、お届け時間に合わせて商品の集荷を行います。<br>
                        そのため、ご注文いただいた商品が品切れする場合がございます。<br><br>

                        (2)ご注文商品が品切れしていた場合、当該商品についてのみ注文のキャンセルをさせていただきます。但し、当社の合理的な選択により、適当な代替品が当社にてご用意できる場合には、当該代替品を希望されるネットスーパー会員に対して当該代替品をお届けさせていただくか、あるいは、当社で商品の容量・数量変更等で対応させていただく場合がございます。なお、商品により対応は異なります。
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
        <jsp:include page="/footer.jsp"/>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</body>
</html>