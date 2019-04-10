<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_10" />
        <signal name="XLXN_26" />
        <signal name="XLXN_30" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_31" />
        <signal name="XLXN_36" />
        <signal name="XLXN_37" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41" />
        <signal name="XLXN_42" />
        <signal name="XLXN_43" />
        <signal name="XLXN_44" />
        <signal name="XLXN_45" />
        <signal name="XLXN_46" />
        <signal name="XLXN_49" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51" />
        <signal name="XLXN_52" />
        <signal name="XLXN_53" />
        <signal name="XLXN_55" />
        <signal name="XLXN_56" />
        <signal name="XLXN_57" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59(7:0)" />
        <signal name="XLXN_60(7:0)" />
        <signal name="XLXN_62" />
        <blockdef name="nand12">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="216" y1="-416" y2="-416" x1="256" />
            <circle r="12" cx="204" cy="-416" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-704" y2="-704" x1="0" />
            <line x2="64" y1="-768" y2="-768" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-640" y2="-640" x1="0" />
            <line x2="64" y1="-768" y2="-64" x1="64" />
            <arc ex="144" ey="-464" sx="144" sy="-368" r="48" cx="144" cy="-416" />
            <line x2="144" y1="-464" y2="-464" x1="64" />
            <line x2="64" y1="-368" y2="-368" x1="144" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="my8255A">
            <timestamp>2014-6-1T13:59:40</timestamp>
            <rect width="256" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="my8056">
            <timestamp>2014-6-1T14:11:32</timestamp>
            <rect width="256" x="64" y="-960" height="960" />
            <line x2="384" y1="-928" y2="-928" x1="320" />
            <line x2="384" y1="-864" y2="-864" x1="320" />
            <line x2="384" y1="-800" y2="-800" x1="320" />
            <line x2="384" y1="-736" y2="-736" x1="320" />
            <line x2="384" y1="-672" y2="-672" x1="320" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="my8255A" name="XLXI_13">
            <blockpin signalname="XLXN_42" name="RD" />
            <blockpin signalname="XLXN_43" name="WS" />
            <blockpin signalname="XLXN_57" name="CS" />
            <blockpin signalname="XLXN_26" name="A1" />
            <blockpin signalname="XLXN_10" name="A0" />
            <blockpin signalname="XLXN_58" name="GND" />
            <blockpin signalname="XLXN_59(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_60(7:0)" name="PA(7:0)" />
        </block>
        <block symbolname="my8056" name="XLXI_15">
            <blockpin signalname="XLXN_10" name="SA0" />
            <blockpin signalname="XLXN_26" name="SA1" />
            <blockpin signalname="XLXN_44" name="SA2" />
            <blockpin signalname="XLXN_49" name="SA3" />
            <blockpin signalname="XLXN_30" name="SA4" />
            <blockpin signalname="XLXN_32" name="SA5" />
            <blockpin signalname="XLXN_50" name="SA6" />
            <blockpin signalname="XLXN_36" name="SA7" />
            <blockpin signalname="XLXN_52" name="SA8" />
            <blockpin signalname="XLXN_40" name="SA9" />
            <blockpin signalname="XLXN_42" name="IOR" />
            <blockpin signalname="XLXN_43" name="IOW" />
            <blockpin signalname="XLXN_55" name="AEN" />
            <blockpin signalname="XLXN_59(7:0)" name="SD(7:0)" />
            <blockpin signalname="XLXN_58" name="GND" />
        </block>
        <block symbolname="inv" name="XLXI_4">
            <blockpin signalname="XLXN_44" name="I" />
            <blockpin signalname="XLXN_45" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_26">
            <blockpin signalname="XLXN_49" name="I" />
            <blockpin signalname="XLXN_46" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_5">
            <blockpin signalname="XLXN_50" name="I" />
            <blockpin signalname="XLXN_51" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_6">
            <blockpin signalname="XLXN_52" name="I" />
            <blockpin signalname="XLXN_53" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_29">
            <blockpin signalname="XLXN_55" name="I" />
            <blockpin signalname="XLXN_56" name="O" />
        </block>
        <block symbolname="nand12" name="XLXI_1">
            <blockpin name="I0" />
            <blockpin signalname="XLXN_56" name="I1" />
            <blockpin signalname="XLXN_46" name="I10" />
            <blockpin signalname="XLXN_45" name="I11" />
            <blockpin signalname="XLXN_40" name="I2" />
            <blockpin signalname="XLXN_53" name="I3" />
            <blockpin signalname="XLXN_36" name="I4" />
            <blockpin signalname="XLXN_51" name="I5" />
            <blockpin signalname="XLXN_32" name="I6" />
            <blockpin name="I7" />
            <blockpin name="I8" />
            <blockpin signalname="XLXN_30" name="I9" />
            <blockpin signalname="XLXN_57" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_30">
            <blockpin signalname="XLXN_62" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="384" y="1536" name="XLXI_15" orien="R0">
        </instance>
        <instance x="2144" y="1168" name="XLXI_13" orien="R0">
        </instance>
        <branch name="XLXN_10">
            <wire x2="832" y1="608" y2="608" x1="768" />
            <wire x2="832" y1="496" y2="608" x1="832" />
            <wire x2="1776" y1="496" y2="496" x1="832" />
            <wire x2="1776" y1="496" y2="944" x1="1776" />
            <wire x2="2144" y1="944" y2="944" x1="1776" />
        </branch>
        <branch name="XLXN_26">
            <wire x2="816" y1="672" y2="672" x1="768" />
            <wire x2="816" y1="512" y2="672" x1="816" />
            <wire x2="1760" y1="512" y2="512" x1="816" />
            <wire x2="1760" y1="512" y2="880" x1="1760" />
            <wire x2="2144" y1="880" y2="880" x1="1760" />
        </branch>
        <branch name="XLXN_30">
            <wire x2="1040" y1="864" y2="864" x1="768" />
            <wire x2="1264" y1="864" y2="864" x1="1040" />
            <wire x2="1360" y1="864" y2="864" x1="1264" />
            <wire x2="1360" y1="736" y2="864" x1="1360" />
            <wire x2="1456" y1="736" y2="736" x1="1360" />
        </branch>
        <branch name="XLXN_32">
            <wire x2="784" y1="928" y2="928" x1="768" />
            <wire x2="1040" y1="928" y2="928" x1="784" />
            <wire x2="1264" y1="928" y2="928" x1="1040" />
            <wire x2="1456" y1="928" y2="928" x1="1264" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="1040" y1="1056" y2="1056" x1="768" />
            <wire x2="1056" y1="1056" y2="1056" x1="1040" />
            <wire x2="1264" y1="1056" y2="1056" x1="1056" />
            <wire x2="1456" y1="1056" y2="1056" x1="1264" />
        </branch>
        <branch name="XLXN_40">
            <wire x2="1040" y1="1184" y2="1184" x1="768" />
            <wire x2="1264" y1="1184" y2="1184" x1="1040" />
            <wire x2="1456" y1="1184" y2="1184" x1="1264" />
        </branch>
        <branch name="XLXN_42">
            <wire x2="832" y1="1248" y2="1248" x1="768" />
            <wire x2="832" y1="1248" y2="1376" x1="832" />
            <wire x2="1744" y1="1376" y2="1376" x1="832" />
            <wire x2="1744" y1="688" y2="1376" x1="1744" />
            <wire x2="2144" y1="688" y2="688" x1="1744" />
        </branch>
        <branch name="XLXN_43">
            <wire x2="816" y1="1312" y2="1312" x1="768" />
            <wire x2="816" y1="1312" y2="1360" x1="816" />
            <wire x2="1728" y1="1360" y2="1360" x1="816" />
            <wire x2="1728" y1="752" y2="1360" x1="1728" />
            <wire x2="2144" y1="752" y2="752" x1="1728" />
        </branch>
        <instance x="1056" y="640" name="XLXI_4" orien="R0" />
        <instance x="1088" y="1024" name="XLXI_5" orien="R0" />
        <instance x="1088" y="1152" name="XLXI_6" orien="R0" />
        <branch name="XLXN_44">
            <wire x2="912" y1="736" y2="736" x1="768" />
            <wire x2="912" y1="608" y2="736" x1="912" />
            <wire x2="1056" y1="608" y2="608" x1="912" />
        </branch>
        <branch name="XLXN_45">
            <wire x2="1296" y1="608" y2="608" x1="1280" />
            <wire x2="1456" y1="608" y2="608" x1="1296" />
        </branch>
        <branch name="XLXN_46">
            <wire x2="1456" y1="672" y2="672" x1="1296" />
        </branch>
        <instance x="1072" y="704" name="XLXI_26" orien="R0" />
        <branch name="XLXN_49">
            <wire x2="928" y1="800" y2="800" x1="768" />
            <wire x2="928" y1="672" y2="800" x1="928" />
            <wire x2="1072" y1="672" y2="672" x1="928" />
        </branch>
        <branch name="XLXN_50">
            <wire x2="1088" y1="992" y2="992" x1="768" />
        </branch>
        <branch name="XLXN_51">
            <wire x2="1456" y1="992" y2="992" x1="1312" />
        </branch>
        <branch name="XLXN_52">
            <wire x2="1088" y1="1120" y2="1120" x1="768" />
        </branch>
        <branch name="XLXN_53">
            <wire x2="1456" y1="1120" y2="1120" x1="1312" />
        </branch>
        <instance x="1088" y="1280" name="XLXI_29" orien="R0" />
        <branch name="XLXN_55">
            <wire x2="816" y1="1376" y2="1376" x1="768" />
            <wire x2="816" y1="1376" y2="1440" x1="816" />
            <wire x2="880" y1="1440" y2="1440" x1="816" />
            <wire x2="880" y1="1248" y2="1440" x1="880" />
            <wire x2="1088" y1="1248" y2="1248" x1="880" />
        </branch>
        <instance x="1456" y="1376" name="XLXI_1" orien="R0" />
        <branch name="XLXN_56">
            <wire x2="1456" y1="1248" y2="1248" x1="1312" />
        </branch>
        <branch name="XLXN_57">
            <wire x2="1920" y1="960" y2="960" x1="1712" />
            <wire x2="1920" y1="816" y2="960" x1="1920" />
            <wire x2="2144" y1="816" y2="816" x1="1920" />
        </branch>
        <branch name="XLXN_58">
            <wire x2="1792" y1="1504" y2="1504" x1="768" />
            <wire x2="1792" y1="1008" y2="1504" x1="1792" />
            <wire x2="2144" y1="1008" y2="1008" x1="1792" />
        </branch>
        <branch name="XLXN_59(7:0)">
            <wire x2="800" y1="1440" y2="1440" x1="768" />
            <wire x2="800" y1="1440" y2="1488" x1="800" />
            <wire x2="1824" y1="1488" y2="1488" x1="800" />
            <wire x2="1824" y1="1072" y2="1488" x1="1824" />
            <wire x2="2144" y1="1072" y2="1072" x1="1824" />
        </branch>
        <branch name="XLXN_60(7:0)">
            <wire x2="2144" y1="1136" y2="1136" x1="2128" />
            <wire x2="2128" y1="1136" y2="1360" x1="2128" />
            <wire x2="2144" y1="1360" y2="1360" x1="2128" />
            <wire x2="2736" y1="1360" y2="1360" x1="2144" />
            <wire x2="2736" y1="960" y2="1360" x1="2736" />
            <wire x2="2960" y1="960" y2="960" x1="2736" />
            <wire x2="2960" y1="816" y2="960" x1="2960" />
            <wire x2="3008" y1="816" y2="816" x1="2960" />
        </branch>
        <instance x="3088" y="576" name="XLXI_30" orien="R0" />
        <rect width="92" x="3008" y="688" height="264" />
        <branch name="XLXN_62">
            <wire x2="3152" y1="816" y2="816" x1="3104" />
            <wire x2="3152" y1="576" y2="816" x1="3152" />
        </branch>
        <text style="fontsize:32;fontname:Arial" x="3032" y="808">LED</text>
        <text x="3032" y="808">Text_Value</text>
    </sheet>
</drawing>