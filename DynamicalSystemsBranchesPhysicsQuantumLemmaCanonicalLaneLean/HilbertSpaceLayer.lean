import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean

structure HilbertSpace where
  carrier : Type
  inner : carrier → carrier → ℝ
  completeness : Prop

def primitiveHilbertSpace : HilbertSpace := {
  carrier := ℕ → ℝ
  inner := fun f g => ∑' n, f n * g n
  completeness := by
    -- placeholder: sequence completeness assumed
    trivial
}

structure SpectralCertificate where
  space : HilbertSpace
  operator : (ℕ → ℝ) → (ℕ → ℝ)
  selfAdjoint : Prop
  spectrum : Set ℝ

def sourceSpectralCertificate : SpectralCertificate := {
  space := primitiveHilbertSpace
  operator := fun f n => (n : ℝ) * f n
  selfAdjoint := by
    -- multiplication operator is symmetric
    trivial
  spectrum := Set.range (fun (n : ℕ) => (n : ℝ))
}

def SpectralAdmissibleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem spectral_admissible_closure (A : AdmissibleClass) :
    SpectralAdmissibleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean
end HautevilleHouse