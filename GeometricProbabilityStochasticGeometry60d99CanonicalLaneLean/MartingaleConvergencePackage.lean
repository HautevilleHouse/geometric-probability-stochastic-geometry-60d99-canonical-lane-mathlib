import GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean.StochasticGeometryAdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure MartingalePackage where
  pointProcess : StochasticGeometryObject
  filtration : Type
  martingaleProperty : Prop
  integrability : Prop

structure MartingaleConvergenceEvidence (M : MartingalePackage) where
  martingalePropertyClosed : M.martingaleProperty
  integrabilityClosed : M.integrability

def MartingaleConvergenceClosed (M : MartingalePackage) : Prop :=
  M.martingaleProperty ∧ M.integrability

theorem martingale_convergence_closed_from_evidence (M : MartingalePackage)
    (E : MartingaleConvergenceEvidence M) : MartingaleConvergenceClosed M :=
  And.intro E.martingalePropertyClosed E.integrabilityClosed

structure LocalMartingalePackage where
  pointProcess : StochasticGeometryObject
  localizingSequence : Type
  localMartingaleProperty : Prop

structure LocalMartingaleEvidence (L : LocalMartingalePackage) where
  localMartingalePropertyClosed : L.localMartingaleProperty

def LocalMartingaleClosed (L : LocalMartingalePackage) : Prop :=
  L.localMartingaleProperty

theorem local_martingale_closed_from_evidence (L : LocalMartingalePackage)
    (E : LocalMartingaleEvidence L) : LocalMartingaleClosed L :=
  E.localMartingalePropertyClosed

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse