import QtQml 2.0
import QtQuick 2.0
import QtQuick.Layouts 1.15
import org.kde.kdeconnect 1.0 as KdeConnect

import org.kde.plasma.core 2.0 as PlasmaCore

import "../lib" as Lib
import "../js/funcs.js" as Funcs

Lib.CardButton {
 id: lowpowermode

    visible: true
    Layout.fillWidth: true
    Layout.fillHeight: true
    title: i18n("Low Power Mode")
//   Component.onCompleted: updateIcon()
 PlasmaCore.IconItem {
        id: lowpowIcon
        anchors.fill: parent
        source: "battery-full"
    }
 function exec(cmd) {
        executable.connectSource(cmd)
    }
 // Updates icon
function updateIcon() {   
    lowpowIcon.source = "battery-full-lowpower"   
    }



function enablelowpower(){
   if (!getPowerMode){
     exec("powerprofilesctl set power-saver")
                }else{
                    exec("powerprofilesctl set balanced")
                }
}
    onClicked: {
       //  enablelowpower()
            updateIcon()
    }

PlasmaCore.DataSource {
        id: executable
        engine: "executable"
        connectedSources: []
        onNewData: { 
            disconnectSource(sourceName)
        }
}
   
  
    

}


        
     