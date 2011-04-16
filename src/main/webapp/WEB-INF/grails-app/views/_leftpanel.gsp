<div class="ff-left" id="ff-left">
<div id="LeftPanel">
<div id="v4-6" class="navp ff-rail">
<!--  Category List -->
<div id="v4-18" class="ds-rlp hier" style="display: block;">
    <div id="e3" class="rlp-h">
        <span class="rlp-x"></span>

        <div class="rlp-t">
            <h3 class="asr-tl">Categories</h3>
        </div>
    </div>

    <div class="rlp-b" style="">
        <div class="rlp-c">
            <div id="v4-17" class="hlist">
                <!-- BEGIN CATEGORY -->
                <div class="hnode"><!-- Primary category name link -->

                    <g:if test="${results}">
                        <g:each in="${results.findItemsByKeywordsResponse.get(0).categoryHistogramContainer.get(0).categoryHistogram}"
                                var="category">
                            <div class="hlink">
                                <a id="{TOP_E_NAME}" href="{TOP_CATEGORY_URL}" role="menuitem"
                                   class="lnk"
                                   role="menuitem">${category.categoryName.get(0).getAsString()}</a>&nbsp;<span
                                    class="cnt">(${category.count.get(0).getAsString()})</span>
                            </div>
                            <!-- BEGIN CATEGORY_LINK -->

                            <g:each in="${category.childCategoryHistogram}" var="child">
                                <div class="hnode">
                                    <div class="hlink">
                                        <a id="{E_NAME}" href="{CATEGORY_URL}"
                                           class="lnk"
                                           role="menuitem">${child.categoryName.get(0).getAsString()}</a>&nbsp;<span
                                            class="cnt">(${child.count.get(0).getAsString()})</span>
                                    </div>
                                </div>
                            </g:each>
                        </g:each>

                    </g:if>

                </div>
                <!-- END CATEGORY -->

                <!-- BEGIN ALL_CATEGORY_LINK -->
                <div class="hnode g-novisited">
                    <div class="hlink">
                        <a id="{ALL_CAT_E_NAME}" href="{ALL_CATEGORIES_URL}"
                           class="lnk" role="menuitem">See all categories</a>
                    </div>
                </div>
                <!-- END ALL_CATEGORY_LINK -->

                <!-- BEGIN EXPANDED_ALL_CATEGORIES -->
                <div class="hnode">
                    <div class="hlink">
                        <a id="{E_NAME}" href="{CATEGORY_URL}"
                           class="lnk" role="menuitem">{CAT_NAME}</a>&nbsp;<span class="cnt">({ITEM_COUNT}
                    )</span>
                    </div>
                </div>
                <!-- END EXPANDED_ALL_CATEGORIES -->

            </div>
        </div>
    </div>
</div>
<!--  End category list -->

<!-- Condition Aspect -->
<div id="v4-7" class="asp">
    <!--  Start Condition -->
    <div id="v4-8" class="ds-rlp asr" style="display: block;">
        <div id="e19" class="rlp-h">
            <span class="rlp-x"></span>

            <div class="rlp-t">
                <h3 class="asr-tl">Condition</h3>
            </div>
        </div>

        <div class="rlp-b" style="">
            <div class="rlp-c">
                <div id="e15" class="asr-b">
                    <div class="asr-v asr-nd">
                        <a id="e16" href=
                        "{SEARCH_URL}?_nkw=test&amp;LH_ItemCondition=1&amp;_odkw=&amp;_osacat=0&amp;_trksid="
                           name="e16"><b></b>New</a>
                    </div>

                    <div class="asr-v asr-nd">
                        <a id="e17" href=
                        "{SEARCH_URL}?_nkw=test&amp;LH_ItemCondition=2&amp;_odkw=&amp;_osacat=0&amp;_trksid="
                           name="e17"><b></b>Used</a>
                    </div>

                    <div class="asr-v asr-nd">
                        <a id="e18" href=
                        "{SEARCH_URL}?_nkw=test&amp;LH_ItemCondition=0&amp;_odkw=&amp;_osacat=0&amp;_trksid="
                           name="e18"><b></b>Not specified</a>
                    </div>

                    <div class="asr-v asr-md"></div>
                </div>
            </div>
        </div>
    </div>
    <!--  End Condition -->

    <!-- Start Price -->
    <div id="v4-14" class="ds-rlp asr" style="display: block;">
        <div id="e22" class="rlp-h">
            <span class="rlp-x"></span>

            <div class="rlp-t">
                <h3 class="asr-tl">Price</h3>
            </div>
        </div>

        <div class="rlp-b" style="">
            <div class="rlp-c">
                <div id="e20" class="asr-b">
                    <form id="e21" method="get" class="asr-price">
                        <div class="asr-e">
                            <div id="EnterPrice" class="msg">
                                Please enter a minimum and/or maximum price before continuing.
                            </div>
                        </div>

                        <div class="range">
                            <input id="v4-13" name="_mPrRngCbx" value="1" type="hidden"/>$
                            <label class="g-hdn" for="v4-11">Enter minimum price</label>
                            <input id="v4-11" name="_udlo" size="6" maxlength="13" class=
                            "price" type="text"/> to $ <label class="g-hdn" for="v4-12">Enter
                        maximum price</label> <input id="v4-12" name="_udhi" size="6"
                                                     maxlength="13" class="price" type="text"/> <input
                                disabled=
                                "disabled" id="q_6" class="submit" type="button"/>&nbsp;
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--  End Price -->

    <!--  Start Seller -->
    <div id="v4-15" class="ds-rlp asr" style="display: block;">
        <div id="e25" class="rlp-h">
            <span class="rlp-x"></span>

            <div class="rlp-t">
                <h3 class="asr-tl">Seller</h3>
            </div>
        </div>

        <div class="rlp-b" style="">
            <div class="rlp-c">
                <div id="e23" class="asr-b">
                    <div class="asr-v asr-nd">
                        <a id="e24" href=
                        "{SEARCH_URL}?_nkw=test&amp;LH_TopRatedSellers=1&amp;_odkw=&amp;_osacat=0&amp;_trksid="
                           name="e24"><b></b>eBay Top-rated sellers</a>
                    </div>

                    <div class="asr-v asr-md"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Seller -->

    <div id="v4-16" class="ds-rlp asr" style="display: block;">
        <div id="e30" class="rlp-h">
            <span class="rlp-x"></span>

            <div class="rlp-t">
                <h3 class="asr-tl">Location</h3>
            </div>
        </div>

        <!-- Start Location -->
        <div class="rlp-b" style="">
            <div class="rlp-c">
                <div id="e26" class="asr-b">
                    <div class="asr-v asr-nd">
                        <a id="e27" href=
                        "{SEARCH_URL}?_nkw=test&amp;LH_PrefLoc=1&amp;_odkw=&amp;_osacat=0&amp;_trksid="
                           name="e27"><b></b>US Only</a>
                    </div>

                    <div class="asr-v asr-nd">
                        <a id="e28" href=
                        "{SEARCH_URL}?_nkw=test&amp;LH_PrefLoc=3&amp;_odkw=&amp;_osacat=0&amp;_trksid="
                           name="e28"><b></b>North America</a>
                    </div>

                    <div class="asr-v asr-nd">
                        <a id="e29" href=
                        "{SEARCH_URL}?_nkw=test&amp;LH_PrefLoc=2&amp;_odkw=&amp;_osacat=0&amp;_trksid="
                           name="e29"><b></b>Worldwide</a>
                    </div>

                    <div class="asr-v asr-md"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Location -->

</div>
</div>
</div>
</div>

