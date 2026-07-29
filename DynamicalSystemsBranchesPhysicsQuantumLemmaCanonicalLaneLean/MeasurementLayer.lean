import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean

structure MeasurementCertificate where
  observable : (ℕ → ℝ) → (ℕ → ℝ)
  spectralDecomposition : Prop
  expectationValue : (ℕ → ℝ) → ℝ
  bornRule : Prop

def positionObservable : (ℕ → ℝ) → (ℕ → ℝ) := fun psi n => (n : ℝ) * psi n

def sourceMeasurementCertificate : MeasurementCertificate := {
  observable := positionObservable
  spectralDecomposition := by
    -- eigenbasis is standard basis; placeholder
    trivial
  expectationValue := fun psi => ∑' n, (n : ℝ) * |psi n|^2
  bornRule := by
    -- probability = |<e_n, psi>|^2; placeholder
    trivial
}

def MeasurementAdmissibleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem measurement_admissible_closure (A : AdmissibleClass) :
    MeasurementAdmissibleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean
end HautevilleHouse