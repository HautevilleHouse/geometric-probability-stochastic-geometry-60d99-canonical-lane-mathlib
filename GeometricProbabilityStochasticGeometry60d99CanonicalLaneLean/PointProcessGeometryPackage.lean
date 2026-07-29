import GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean.MartingaleConvergencePackage

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure StationaryPointProcessPackage where
  pointProcess : StochasticGeometryObject
  intensityMeasure : Type
  ergodicity : Prop
  palmMeasure : Type

structure StationaryEvidence (S : StationaryPointProcessPackage) where
  ergodicityClosed : S.ergodicity

def StationaryClosed (S : StationaryPointProcessPackage) : Prop :=
  S.ergodicity

theorem stationary_closed_from_evidence (S : StationaryPointProcessPackage)
    (E : StationaryEvidence S) : StationaryClosed S :=
  E.ergodicityClosed

structure GibbsPointProcessPackage where
  pointProcess : StochasticGeometryObject
  energyFunctional : Type
  specification : Prop

def GibbsClosed (G : GibbsPointProcessPackage) : Prop := G.specification

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse