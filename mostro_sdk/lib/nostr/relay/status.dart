/// Relay connection status
enum RelayStatus {
  // Relay initialized
  initialized,
  // Relay connected
  connected,
  // Connecting
  connecting,
  // Relay disconnected, will retry to connect again
  disconnected,
  // Relay completly disconnected
  terminated,
}
