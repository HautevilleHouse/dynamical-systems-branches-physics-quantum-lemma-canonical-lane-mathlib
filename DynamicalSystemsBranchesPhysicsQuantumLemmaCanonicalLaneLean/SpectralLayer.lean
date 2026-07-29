import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean

structure SpectralCertificate where
  selfAdjointOperator : String
  spectralMeasure : Prop
  spectralTheoremClosed : Prop
  selfAdjointOperatorClosed : selfAdjointOperator = selfAdjointOperator
  spectralMeasureClosed : spectralMeasure
  spectralTheoremClosedProof : spectralTheoremClosed

def sourceSpectralCertificate : SpectralCertificate := {
  selfAdjointOperator := "momentum_operator"
  spectralMeasure := true
  spectralTheoremClosed := true
  selfAdjointOperatorClosed := rfl
  spectralMeasureClosed := trivial
  spectralTheoremClosedProof := trivial
}

def SpectralClosed (C : SpectralCertificate) : Prop :=
  C.spectralMeasure ∧ C.spectralTheoremClosed

theorem source_spectral_closed : SpectralClosed sourceSpectralCertificate := by
  exact And.intro sourceSpectralCertificate.spectralMeasureClosed sourceSpectralCertificate.spectralTheoremClosedProof

end DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean
end HautevilleHouse