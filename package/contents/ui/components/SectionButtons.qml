import QtQml 2.0
import QtQuick 2.0
import QtQuick.Layouts 1.15

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.bluezqt 1.0 as BluezQt
import org.kde.kquickcontrolsaddons 2.0
import org.kde.plasma.networkmanagement 0.2 as PlasmaNM

import "../lib" as Lib
import "../js/funcs.js" as Funcs

Lib.Card {
    id: sectionButtons
    Layout.fillWidth: true
    Layout.fillHeight: true
    
    // NETWORK
    property string wifiNetworkName: ""

    property var network: network
    Network {
        id: network
    }
    
    // BLUETOOTH
    property QtObject btManager : BluezQt.Manager
 
   
    // All Buttons
    ColumnLayout {
        id: buttonsColumn
        anchors.fill: parent
        anchors.bottomMargin: root.smallSpacing
        anchors.topMargin: root.smallSpacing
      
        Lib.LongButton {
            title:  wifiNetworkName
            subtitle: network.networkStatus
            source: network.activeConnectionIcon
            sourceColor: network.networkStatus === "Connected" ? PlasmaCore.Theme.highlightColor : PlasmaCore.Theme.disabledTextColor
            onClicked: {
                sectionNetworks.toggleNetworkSection()
            }
        }
        
        Lib.LongButton {
            title: i18n("Bluetooth")
            subtitle: Funcs.getBtDevice()
            source: "network-bluetooth"
            onClicked: {
                Funcs.toggleBluetooth()
            }
        }
        
        Lib.LongButton {
            title: i18n("Settings")
            subtitle: i18n("System Settings")
            source: "settings-configure"
            onClicked: {
                KCMShell.openSystemSettings("")
            }
        }
            Lib.LongButton {
            title:  wifiNetworkName
            subtitle: network.networkStatus
            source: network.activeConnectionIcon
            sourceColor: network.networkStatus === "Connected" ? PlasmaCore.Theme.highlightColor : PlasmaCore.Theme.disabledTextColor
            onClicked: {
                sectionNetworks.toggleNetworkSection()
            }
        }
    
    }
}