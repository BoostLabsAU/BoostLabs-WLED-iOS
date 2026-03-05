//
//  Settings.swift
//  WLED
//
//  Created by Christophe Gagnier on 2025-12-28.
//

import SwiftUI

struct Settings: View {
    @Binding var showHiddenDevices: Bool
    @Binding var showOfflineDevices: Bool

    // Environment to dismiss the sheet
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("View Options") {
                    Toggle(isOn: $showHiddenDevices) {
                        Label("Show Hidden Devices", systemImage: "eye")
                    }

                    Toggle(isOn: $showOfflineDevices) {
                        Label("Show Offline Devices", systemImage: "wifi.slash")
                    }
                }

                Section {
                    if let url = URL(string: "https://kno.wled.ge/") {
                        Link(destination: url) {
                            Label("WLED Documentation", systemImage: "questionmark.circle")
                        }
                    }
                    if let repositoryURL = URL(string: "https://github.com/BoostLabsAU/BoostLabs-WLED-iOS") {
                        Link(destination: repositoryURL) {
                            Label("BoostLabs WLED Repository", systemImage: "chevron.left.forwardslash.chevron.right")
                        }
                    }
                } header: {
                    Text("About")
                } footer: {
                    VStack(alignment: .center) {
                        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
                        let bundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1.0"

                        Text("BoostLabs WLED")
                        Text("Version \(version) (\(bundleVersion))")
                    }
                    .frame(maxWidth: .infinity)
                }

            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    Settings(
        showHiddenDevices: .constant(true), showOfflineDevices: .constant(true)
    )
}

