import QtQml 2.0
import QtQuick 2.0
import QtQuick.Layouts 1.15
import org.kde.kdeconnect 1.0 as KdeConnect
import org.kde.kcoreaddons 1.0 as KCoreAddons
import org.kde.kquickcontrolsaddons 2.1 // For KCMShell
import org.kde.plasma.core 2.1 as PlasmaCore
import org.kde.plasma.plasmoid 2.0

import QtQuick 2.0
import QtQuick.Layouts 1.15

import org.kde.plasma.components 2.0 as PlasmaComponents


import "../lib" as Lib
import "../js/funcs.js" as Funcs

Lib.CardButton {
 id: lowpowermode

    visible: plasmoid.configuration.showLowpower
    Layout.fillWidth: true
    Layout.fillHeight: true
  title: i18n("")
 // Component.onCompleted: updateIcon()
 PlasmaCore.IconItem {
        id: lowpowIcon
        source: plasmoid.configuration.lowpoweron ? "battery-full-lowpower.svg" : "battery-full"
        anchors.fill: parent
       

      //
       // Alignment.horizontalCenter: parent.horizontalCenter
      //  Alignment.verticalCenter: parent.verticalCenter
        
    }

     
 function exec(cmd) {
    executable.connectSource(cmd)
    }



function setpowermode(profile){
   
    exec("powerprofilesctl set " + profile)
    if(profile == "power-saver"){
        lowpowIcon.source = "battery-full-lowpower.svg"   
        plasmoid.configuration.lowpoweron = true
    }else{
        lowpowIcon.source = "battery-full"
        plasmoid.configuration.lowpoweron = false
    }
}
    onClicked: {
      if(plasmoid.configuration.lowpoweron == true){
          setpowermode("balanced")}else{
          setpowermode("power-saver")
          }
      // updateIcon()
        //dialogItem.activeProfile = profile;
        
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


        
     