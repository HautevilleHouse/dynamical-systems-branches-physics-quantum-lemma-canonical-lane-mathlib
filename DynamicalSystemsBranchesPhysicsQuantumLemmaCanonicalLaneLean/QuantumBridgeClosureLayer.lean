import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean

structure QuantumBridgeCertificate where
  observable : QuantumObservableCertificate
  uncertainty : UncertaintyCertificate
  spectral : SpectralTheoremCertificate
  stateSpace : StateSpaceCertificate
  commutation : CommutationRelationsCertificate
  observableClosed : QuantumObservableClosed observable
  uncertaintyClosed : UncertaintyClosed uncertainty
  spectralClosed : SpectralTheoremClosed spectral
  stateSpaceClosed : StateSpaceClosed stateSpace
  commutationClosed : CommutationRelationsClosed commutation

def sourceQuantumBridgeCertificate : QuantumBridgeCertificate := {
  observable := sourceQuantumObservableCertificate
  uncertainty := sourceUncertaintyCertificate
  spectral := sourceSpectralTheoremCertificate
  stateSpace := sourceStateSpaceCertificate
  commutation := sourceCommutationRelationsCertificate
  observableClosed := source_quantum_observable_closed
  uncertaintyClosed := source_uncertainty_closed
  spectralClosed := source_spectral_theorem_closed
  stateSpaceClosed := source_state_space_closed
  commutationClosed := source_commutation_relations_closed
}

def QuantumBridgeClosed (C : QuantumBridgeCertificate) : Prop :=
  QuantumObservableClosed C.observable ∧
  UncertaintyClosed C.uncertainty ∧
  SpectralTheoremClosed C.spectral ∧
  StateSpaceClosed C.stateSpace ∧
  CommutationRelationsClosed C.commutation

theorem source_quantum_bridge_closed :
    QuantumBridgeClosed sourceQuantumBridgeCertificate := by
  exact And.intro sourceQuantumBridgeCertificate.observableClosed
    (And.intro sourceQuantumBridgeCertificate.uncertaintyClosed
      (And.intro sourceQuantumBridgeCertificate.spectralClosed
        (And.intro sourceQuantumBridgeCertificate.stateSpaceClosed
          sourceQuantumBridgeCertificate.commutationClosed)))

end DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean
end HautevilleHouse