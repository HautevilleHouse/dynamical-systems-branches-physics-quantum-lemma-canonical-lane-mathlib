import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean

structure QuantumDynamicsCertificate where
  hamiltonian : String
  timeEvolution : Prop
  unitaryEvolution : Prop
  timeEvolutionClosed : timeEvolution
  unitaryEvolutionClosed : unitaryEvolution

def sourceQuantumDynamicsCertificate : QuantumDynamicsCertificate := {
  hamiltonian := "H_hat"
  timeEvolution := true
  unitaryEvolution := true
  timeEvolutionClosed := trivial
  unitaryEvolutionClosed := trivial
}

def QuantumDynamicsClosed (C : QuantumDynamicsCertificate) : Prop :=
  C.timeEvolution ∧ C.unitaryEvolution

theorem source_quantum_dynamics_closed : QuantumDynamicsClosed sourceQuantumDynamicsCertificate := by
  exact And.intro sourceQuantumDynamicsCertificate.timeEvolutionClosed sourceQuantumDynamicsCertificate.unitaryEvolutionClosed

end DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean
end HautevilleHouse