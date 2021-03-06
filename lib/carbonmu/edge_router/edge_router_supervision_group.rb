require "carbonmu/edge_router/edge_router"

Celluloid::ZMQ.init

module CarbonMU
  class EdgeRouterSupervisionGroup < Celluloid::SupervisionGroup
    supervise EdgeRouter, as: :edge_router, args: ["0.0.0.0", 8421]
  end
end
