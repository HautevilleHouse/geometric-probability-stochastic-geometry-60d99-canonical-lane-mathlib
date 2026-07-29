import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure MartingaleConvergencePackage where
  martingaleProperty : Prop
  convergenceTheorem : Prop
  uniformIntegrability : Prop
  stoppingTimes : Prop

structure MartingaleConvergenceEvidence (M : MartingaleConvergencePackage) where
  martingalePropertyClosed : M.martingaleProperty
  convergenceTheoremClosed : M.convergenceTheorem
  uniformIntegrabilityClosed : M.uniformIntegrability
  stoppingTimesClosed : M.stoppingTimes

def MartingaleConvergenceClosed (M : MartingaleConvergencePackage) : Prop :=
  M.martingaleProperty ∧ M.convergenceTheorem ∧
  M.uniformIntegrability ∧ M.stoppingTimes

theorem martingale_convergence_closed_from_evidence
    (M : MartingaleConvergencePackage) (E : MartingaleConvergenceEvidence M) :
    MartingaleConvergenceClosed M := by
  exact And.intro E.martingalePropertyClosed
    (And.intro E.convergenceTheoremClosed
      (And.intro E.uniformIntegrabilityClosed E.stoppingTimesClosed))

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse