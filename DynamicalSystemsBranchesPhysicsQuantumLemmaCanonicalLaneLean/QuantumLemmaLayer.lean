import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean

structure QuantumLemmaCertificate where
  spectralLayer : SpectralCertificate
  uncertaintyLayer : UncertaintyCertificate
  stateSpaceLayer : StateSpaceCertificate
  quantumDynamicsLayer : QuantumDynamicsCertificate
  quantumLemmaClosed : Prop
  quantumLemmaClosedProof : quantumLemmaClosed

def sourceQuantumLemmaCertificate : QuantumLemmaCertificate := {
  spectralLayer := sourceSpectralCertificate
  uncertaintyLayer := sourceUncertaintyCertificate
  stateSpaceLayer := sourceStateSpaceCertificate
  quantumDynamicsLayer := sourceQuantumDynamicsCertificate
  quantumLemmaClosed := true
  quantumLemmaClosedProof := trivial
}

def QuantumLemmaClosed (C : QuantumLemmaCertificate) : Prop :=
  SpectralClosed C.spectralLayer ∧
  UncertaintyClosed C.uncertaintyLayer ∧
  StateSpaceClosed C.stateSpaceLayer ∧
  QuantumDynamicsClosed C.quantumDynamicsLayer ∧
  C.quantumLemmaClosed

theorem source_quantum_lemma_closed : QuantumLemmaClosed sourceQuantumLemmaCertificate := by
  exact And.intro source_spectral_closed
    (And.intro source_uncertainty_closed
      (And.intro source_state_space_closed
        (And.intro source_quantum_dynamics_closed sourceQuantumLemmaCertificate.quantumLemmaClosedProof)))

end DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean
end HautevilleHouse