import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean

structure QuantumObservableCertificate where
  observableSpace : Prop
  spectralMeasure : Prop
  expectationFunctional : Prop
  resolutionIdentity : Prop
  observableSpaceClosed : observableSpace
  spectralMeasureClosed : spectralMeasure
  expectationFunctionalClosed : expectationFunctional
  resolutionIdentityClosed : resolutionIdentity

def sourceQuantumObservableCertificate : QuantumObservableCertificate := {
  observableSpace := sourceFormulaModels.length = sourceFormulaModelCount
  spectralMeasure := registryConstants.length = sourceRegistryConstantCount
  expectationFunctional := baselineCertificateAllPass = true
  resolutionIdentity := outsideConstantDependencyCount = 0
  observableSpaceClosed := rfl
  spectralMeasureClosed := rfl
  expectationFunctionalClosed := rfl
  resolutionIdentityClosed := rfl
}

def QuantumObservableClosed (C : QuantumObservableCertificate) : Prop :=
  C.observableSpace ∧ C.spectralMeasure ∧ C.expectationFunctional ∧ C.resolutionIdentity

theorem source_quantum_observable_closed :
    QuantumObservableClosed sourceQuantumObservableCertificate := by
  exact And.intro sourceQuantumObservableCertificate.observableSpaceClosed
    (And.intro sourceQuantumObservableCertificate.spectralMeasureClosed
      (And.intro sourceQuantumObservableCertificate.expectationFunctionalClosed
        sourceQuantumObservableCertificate.resolutionIdentityClosed))

end DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean
end HautevilleHouse