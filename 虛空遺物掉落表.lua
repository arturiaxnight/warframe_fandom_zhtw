{{WorkingOn|~~~~}}
<onlyinclude>{{#vardefine:Name|{{#ifeq: {{{name|}}}||{{PAGENAME}}|{{{name|}}}}}}}<!--
-->{{#vardefine:cDucat1| {{虛空遺物掉落表/校對|{{#var:Name}}|Common|1|{{{cDucat1|15}}}}} }}<!--
-->{{#vardefine:cDucat2| {{虛空遺物掉落表/校對|{{#var:Name}}|Common|2|{{{cDucat2|15}}}}} }}<!--
-->{{#vardefine:cDucat3| {{虛空遺物掉落表/校對|{{#var:Name}}|Common|3|{{{cDucat3|15}}}}} }}<!--
-->{{#vardefine:uDucat1| {{虛空遺物掉落表/校對|{{#var:Name}}|Uncommon|1|{{{uDucat1|45}}}}} }}<!--
-->{{#vardefine:uDucat2| {{虛空遺物掉落表/校對|{{#var:Name}}|Uncommon|2|{{{uDucat2|45}}}}} }}<!--
-->{{#vardefine:rDucat1| {{虛空遺物掉落表/校對|{{#var:Name}}|Rare|1|{{{rDucat1|100}}}}} }}<!--
-->'''{{#var:Name}}'''顯示虛空中[[Prime]]部件以及藍圖位置如下：
{| class="emodtable" id="72656C6963table"
|-
!width="240px"| 部件 !!width="50px"| 杜卡德金幣 !!width="100px"| 品質&nbsp;(掉落機率)
|-
|style="padding:0 5px 0 0; height: 32px;"| {{#invoke:Void|getRelicDrop|{{#var:Name}}|Common|1}}
| {{dc|{{#var:cDucat1}}}}
|rowspan="3" style="padding:0;"| <div style="position: float; margin: 0; padding: 0; height:32px;"></div><span id="relic-common-percentage">常見<br />(25.33%)</span>
<div style="position: float; margin: 35px 0 0 0; background-color:#2d2d2d; padding: 0; height:5px; vertical-align: bottom;">
{| id="relic-common-bar" style="border-collapse:collapse; width:76%;"
|style="background-color:#61d4d4; height:5px; margin:0; padding:0; border: 0px;"|
|}</div>
|-
|style="padding:0 5px 0 0; height: 32px;"| {{#invoke:Void|getRelicDrop|{{#var:Name}}|Common|2}}
| {{dc|{{#var:cDucat2}}}}
|-
|style="padding:0 5px 0 0; height: 32px;"| {{#invoke:Void|getRelicDrop|{{#var:Name}}|Common|3}}
| {{dc|{{#var:cDucat3}}}}
|-
|style="padding:0 5px 0 0; height: 32px;"| {{#invoke:Void|getRelicDrop|{{#var:Name}}|Uncommon|1}}
| {{dc|{{#var:uDucat1}}}}
|rowspan="2" style="padding:0;"| <div style="position: float; margin: 0; padding: 0; height:14px;"></div><span id="relic-uncommon-percentage">罕見<br />(11%)</span>
<div style="position: float; margin: 14px 0 0 0; background-color:#2d2d2d; padding: 0; height:5px; vertical-align: bottom;">
{| id="relic-uncommon-bar" style="border-collapse:collapse; width:22%;"
|style="background-color:#61d4d4; height:5px; margin:0; padding:0; border: 0px;"|
|}</div>
|-
|style="padding:0 5px 0 0; height: 32px;"| {{#invoke:Void|getRelicDrop|{{#var:Name}}|Uncommon|2}}
| {{dc|{{#var:uDucat2}}}}
|-
|rowspan="2" style="padding:0 5px 0 0; height: 32px;"| {{#invoke:Void|getRelicDrop|{{#var:Name}}|Rare|1}}
|rowspan="2" | {{dc|{{#var:rDucat1}}}}
| <span id="relic-rare-percentage">稀有(2%)</span>
|-
|style="background-color:#2d2d2d; padding: 0; height:5px; vertical-align: center;"|
{| id="relic-rare-bar" style="border-collapse:collapse; width:2%;"
|style="background-color:#61d4d4; height:5px; margin:0; padding:0; border: 0px;"|
|}
|-
|colspan="3"|{{#ifeq: {{{vaulted|}}}||<div class="mw-collapsible" style="width:100%;text-align:right;" data-expandtext="掉落地點" data-collapsetext="掉落地點"> <span class="button" id="relic-intact-button">完整</span> <span class="button" id="relic-exceptional-button">優良</span> <span class="button" id="relic-flawless-button">無暇</span> <span class="button" id="relic-radiant-button">光輝</span>
<div class="mw-collapsible-content" style="position: float; margin: -10px 0 0 0; padding: 0;">{{#invoke:掉落表|getRelicByLocation|{{#var:Name}}}}
</div></div>|<span class="button" id="relic-intact-button">完整</span> <span class="button" id="relic-exceptional-button">優良</span> <span class="button" id="relic-flawless-button">無暇</span> <span class="button" id="relic-radiant-button">光輝</span>}}
|}</onlyinclude>
{{使用說明}}
