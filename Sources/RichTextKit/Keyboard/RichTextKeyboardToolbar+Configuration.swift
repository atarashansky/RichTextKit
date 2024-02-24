//
//  File.swift
//  
//
//  Created by Ryan Jarvis on 2/23/24.
//

import Foundation
import SwiftUI

#if iOS || macOS || os(visionOS)

/// This struct can be used to configure a `RichTextKeyboardToolbar`.
public struct RichTextKeyboardToolbarConfiguration {

    /**
     - Parameters:
       - alwaysDisplayToolbar: Should the toolbar always be shown, by default `false`.
     */
    public init(
        alwaysDisplayToolbar: Bool = false
    ) {
        self.alwaysDisplayToolbar = alwaysDisplayToolbar
    }

    /// Should the toolbar always be shown.
    var alwaysDisplayToolbar: Bool

    /// Default value
    static var standard: RichTextKeyboardToolbarConfiguration = .init()
}

/// This environment key defines a `RichTextKeyboardToolbar` configuration.
struct RichTextKeyboardToolbarConfigurationKey: EnvironmentKey {
    public static var defaultValue: RichTextKeyboardToolbarConfiguration = .standard
}

public extension View {

    /// Apply a `RichTextKeyboardToolbar` configuration.
    func richTextKeyboardToolbarConfiguration(
        _ configuration: RichTextKeyboardToolbarConfiguration
    ) -> some View {
        self.environment(\.richTextKeyboardToolbarConfiguration, configuration)
    }
}

public extension EnvironmentValues {

    /// This environment value defines `RichTextKeyboardToolbar` configurations.
    var richTextKeyboardToolbarConfiguration: RichTextKeyboardToolbarConfiguration {
        get { self [RichTextKeyboardToolbarConfigurationKey.self] }
        set { self [RichTextKeyboardToolbarConfigurationKey.self] = newValue }
    }
}
#endif
