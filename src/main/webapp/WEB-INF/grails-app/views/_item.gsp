<%@ page import="org.joda.time.chrono.ISOChronology; org.joda.time.DateTime" %>

<a name="item{ITEM_ID_HEX}"></a>
<table class="li">
    <tbody>
    <tr>
        <td class="pic p140 lt"><a href="#" class="x140 img">

            <g:if test="${item.galleryURL != null}">

                <img class="img" src="${item.galleryURL.get(0).getAsString()}" alt="Item image"/></a>
            </g:if>
        </td>

        <td class="dtl ttl"><a
                href="http://cgi.ebay.com/${item.title.get(0).getAsString()}/${item.itemId.get(0).getAsString()}"
                class="vip">${item.get("title").get(0).getAsString()}</a></td>

        <td class="trs">
            <g:if test="${item.sellerInfo.get(0).topRatedSeller.get(0).getAsBoolean()}">
                <img src="http://p.ebaystatic.com/aw/pics/icons/iconTrsXSmall.gif"
                     alt="Get fast shipping and excellent service when you buy from eBay Top-rated sellers"
                     height="30" width="66"/>
            </g:if>
        </td>

         <g:if test="${item.sellingStatus.get(0).bidCount != null}">
            <td class="bids bin1">${item.sellingStatus.get(0).bidCount.get(0)} Bids</td>
        </g:if>
        <g:else>
            <td class="bids bin1">0 Bids</td>
        </g:else>

        <td class="prc g-b">${item.sellingStatus.get(0).currentPrice.get(0).__value__.getAsString()} ${item.sellingStatus.get(0).currentPrice.get(0).get('@currencyId').getAsString()}</td>

        <td class="tme rt"><b class="hidlb">Time left:</b> <span class=
                                                                 "{ALERT_OR_NOT}">${item.sellingStatus.get(0).timeLeft.get(0)}</span></td>
    </tr>
    </tbody>
</table>