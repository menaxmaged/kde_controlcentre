import QtQml 2.0
import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

import "../lib" as Lib


Lib.CardButton {
    id: colorSchemeSwitcher

    visible: root.showColorSwitcher
    Layout.fillHeight: true
    Layout.fillWidth: true
    title: i18n(plasmoid.configuration.isDarkTheme ? "Dark Theme" : "Light Theme")
    PlasmaCore.IconItem {
        anchors.fill: parent
        source: plasmoid.configuration.isDarkTheme ? "dark-mode-symbolic" : "light-mode-symbolic"
    }

    onClicked: {
        executable.swapColorScheme();
        plasmoid.configuration.isDarkTheme = !plasmoid.configuration.isDarkTheme
        colorSchemeSwitcher.source = plasmoid.configuration.isDarkTheme ? "dark-mode-symbolic" : "light-mode-symbolic"

    }

    PlasmaCore.DataSource {
        id: executable
        engine: "executable"
        connectedSources: []
        onNewData: { 
            disconnectSource(sourceName)
        }
        
        function exec(cmd) {
            connectSource(cmd)
        }

        function swapColorScheme() {
            var colorSchemeName = plasmoid.configuration.isDarkTheme ? "light" : "dark"
            exec("theme-switcher.sh " + colorSchemeName)
        }
    }
}
