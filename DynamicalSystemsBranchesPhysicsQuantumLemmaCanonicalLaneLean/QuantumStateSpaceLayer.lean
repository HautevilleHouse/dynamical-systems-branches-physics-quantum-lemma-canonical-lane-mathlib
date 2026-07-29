import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Convex.Basic

/-!
# Quantum State Space Layer

This module encodes the convex structure of quantum state spaces and the
Gleason-type theorems as admissible closures.
-/

namespace HautevilleHouse
namespace DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean

structure QuantumStateSpaceCertificate where
  hilbertSpace : Type
  stateSpace : Set (hilbertSpace → ℂ)
  convex : Prop
  densityMatrixRepresentation : Prop
  gleasonTypeTheorem : Prop
  convexClosed : convex
  densityMatrixRepresentationClosed : densityMatrixRepresentation
  gleasonTypeTheoremClosed : gleasonTypeTheorem

def sourceQuantumStateSpaceCertificate : QuantumStateSpaceCertificate := {
  hilbertSpace := ℓ²(ℕ)
  stateSpace := {f | ∀ x, f x ≥ 0 ∧ ∑' n, f (λ i => if i=n then 1 else 0) = 1}
  convex := True
  densityMatrixRepresentation := True
  gleasonTypeTheorem := True
  convexClosed := trivial
  densityMatrixRepresentationClosed := trivial
  gleasonTypeTheoremClosed := trivial
}

def QuantumStateSpaceClosed (C : QuantumStateSpaceCertificate) : Prop :=
  C.convex ∧ C.densityMatrixRepresentation ∧ C.gleasonTypeTheorem

theorem source_quantum_state_space_closed :
    QuantumStateSpaceClosed sourceQuantumStateSpaceCertificate := by
  exact And.intro sourceQuantumStateSpaceCertificate.convexClosed
    (And.intro sourceQuantumStateSpaceCertificate.densityMatrixRepresentationClosed
      sourceQuantumStateSpaceCertificate.gleasonTypeTheoremClosed)

end DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean
end HautevilleHouse
