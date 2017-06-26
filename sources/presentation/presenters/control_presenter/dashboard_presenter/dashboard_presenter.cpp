#include "dashboard_presenter.h"

// Qt
#include <QVariant>
#include <QMultiMap>

// Internal
#include "telemetry.h"

#include "base_presenter.h"

using namespace presentation;

class DashboardPresenter::Impl
{
public:
    QStringList instruments;
    QMultiMap<QString, BasePresenter*> instrumentPresenters;
};

DashboardPresenter::DashboardPresenter(QObject* parent):
    BasePresenter(parent),
    d(new Impl())
{}

DashboardPresenter::~DashboardPresenter()
{
    this->setViewProperty(PROPERTY(instruments), QStringList());
}

void DashboardPresenter::addInstrument(const QString& instrument, BasePresenter* presenter)
{
    if (!d->instruments.contains(instrument))
    {
        d->instruments.append(instrument);
    }

    d->instrumentPresenters.insertMulti(instrument, presenter);
}

void DashboardPresenter::connectView(QObject* view)
{
    connect(view, SIGNAL(instrumentAdded(QString, QObject*)),
            this, SLOT(onInstrumentAdded(QString, QObject*)));

    this->setViewProperty(PROPERTY(instruments), d->instruments);
}

void DashboardPresenter::onInstrumentAdded(const QString& key, QObject* view)
{
    for (BasePresenter* instrument: d->instrumentPresenters.values(key))
    {
        instrument->setView(view);
    }
}
