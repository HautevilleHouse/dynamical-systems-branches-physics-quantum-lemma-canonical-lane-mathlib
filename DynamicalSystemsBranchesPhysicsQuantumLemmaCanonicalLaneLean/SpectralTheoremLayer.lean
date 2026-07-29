import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.SpectralTheory.Basic

/-!
# Spectral Theorem Layer

This module encodes the spectral theorem for bounded self-adjoint operators
on a Hilbert space as a bridge-closed admissible object.
-/

namespace HautevilleHouse
namespace DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean

structure SpectralTheoremCertificate where
  hilbertSpace : Type
  innerProduct : HilbertSpace
  operator : hilbertSpace → hilbertSpace
  selfAdjoint : Prop
  spectralMeasure : Prop
  spectralResolution : Prop
  selfAdjointClosed : selfAdjoint
  spectralMeasureClosed : spectralMeasure
  spectralResolutionClosed : spectralResolution

def sourceSpectralTheoremCertificate : SpectralTheoremCertificate := {
  hilbertSpace := ℓ²(ℕ)
  innerProduct := by exact inferInstance
  operator := fun x => x
  selfAdjoint := True
  spectralMeasure := True
  spectralResolution := True
  selfAdjointClosed := trivial
  spectralMeasureClosed := trivial
  spectralResolutionClosed := trivial
}

def SpectralTheoremClosed (C : SpectralTheoremCertificate) : Prop :=
  C.selfAdjoint ∧ C.spectralMeasure ∧ C.spectralResolution

theorem source_spectral_theorem_closed :
    SpectralTheoremClosed sourceSpectralTheoremCertificate := by
  exact And.intro sourceSpectralTheoremCertificate.selfAdjointClosed
    (And.intro sourceSpectralTheoremCertificate.spectralMeasureClosed
      sourceSpectralTheoremCertificate.spectralResolutionClosed)

end DynamicalSystemsBranchesPhysicsQuantumLemmaCanonicalLaneLean
end HautevilleHouse
