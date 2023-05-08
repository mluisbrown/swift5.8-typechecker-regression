import ComposableArchitecture
import Foundation

struct State: Equatable {
  var counter: Int
}

enum Action: Equatable {
  case increment
}

struct One: ReducerProtocol {
  let effect: @Sendable () async -> Void
  func reduce(into state: inout State, action _: Action) -> EffectTask<Action> {
    state.counter += 1
    return .fireAndForget {
      await self.effect()
    }
  }
}

struct Two: ReducerProtocol {
  let effect: @Sendable () async -> Void
  func reduce(into state: inout State, action _: Action) -> EffectTask<Action> {
    state.counter += 1
    return .fireAndForget {
      await self.effect()
    }
  }
}

var first = false
var second = false

struct Combined: ReducerProtocol {
  /// in the `body` below, successive chaining of
  /// `.onChange` increase compile time exponentially
  /// with Xcode 14.3 / Swift 5.8, whereas with
  /// Xcode 14.2 / Swift 5.7 any length of chain compiles
  /// very quicky.
  ///
  /// 9 chains: 3 seconds
  /// 10 chains: 6 seconds
  /// 11 chains: 12 seconds
  /// 12 chains: 30 seconds

  var body: some ReducerProtocol<State, Action> {
    CombineReducers {
      One(effect: { @MainActor in first = true })
      Two(effect: { @MainActor in second = true })
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }.onChange(of: \.counter) { _, _, _ in
      .send(.increment)
    }
  }
}
