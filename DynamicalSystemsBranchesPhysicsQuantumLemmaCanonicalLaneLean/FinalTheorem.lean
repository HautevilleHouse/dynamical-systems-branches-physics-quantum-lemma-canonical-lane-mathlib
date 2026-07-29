import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.BridgeLemmas
import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean

def ConstrainedQuantumClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_quantum_endgame (A : AdmissibleClass) :
    ConstrainedQuantumClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean
end HautevilleHouse
